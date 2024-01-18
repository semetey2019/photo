import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photo/features/auth/presentation/widgets/button_widget.dart';
import 'package:photo/features/main/presentation/pages/home/home.dart';

import '../../../../../config/helpers/validators.dart';
import '../../../../core/constants/snack_bar.dart';
import '../widgets/pass_text_fild.dart';
import '../widgets/text_form_widget.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();

  final emailController = TextEditingController();

  bool checkedValue = true;
  bool isCompleted = false;
  bool isValidatePassword = false;
  bool isValidateConfirmPassword = false;
  bool isValidateEmail = false;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();

    super.dispose();
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);

    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    if (passController.text != passController.text) {
      SnackBarService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        SnackBarService.showSnackBar(
          context,
          'Такой Email уже используется, повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        // ignore: use_build_context_synchronously
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
      }
    }

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/images/union2.png",
            width: 12,
            height: 12,
            color: Colors.black,
          ),
          onPressed: () {
            if ((user == null)) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DiscoverPage()),
              );
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 32, right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Comfortaa-Bold",
                ),
              ),
              const SizedBox(height: 32),
              TextFormFieldWidget(
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                hinText: "jane@example.com",
                isError: isValidateEmail,
                validator: (value) {
                  if (isValidPhoneNumber(value!) == null) {
                    setState(() => isValidateEmail = true);
                    return '';
                  } else {
                    setState(() => isValidateEmail = false);
                    return null;
                  }
                },
                controller: emailController,
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PassTextField(
                controller: passController,
                isError: isValidateConfirmPassword,
                validator: (value) {
                  if (value != null && value.length > 2) {
                    setState(() => isValidatePassword = false);
                    return null;
                  } else {
                    setState(() => isValidatePassword = true);
                    return "";
                  }
                },
                hinText: '••••••••••••',
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                onPressed: () async {
                  bool isAuthorized = await FireBaseServices().authByEmail(
                      email: emailController.text,
                      password: passController.text);
                  if (isAuthorized) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('error')));
                  }
                },
                color: const BorderSide(color: Colors.black),
                text: "NEXT",
                textColor: const TextStyle(color: Colors.white),
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 52),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScaffoldMassanger {}

class FireBaseServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> authByEmail(
      {required String email, required String password}) async {
    bool isAuthorized = false;
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      isAuthorized = true;
      print(result);
    } catch (e) {
      print(
        e.toString(),
      );
    }
    return isAuthorized;
  }
}
