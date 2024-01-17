import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photo/features/auth/presentation/pages/register_policy.dart';

import '../../../../config/helpers/validators.dart';
import '../../../../core/constants/snack_bar.dart';
import '../widgets/button_widget.dart';
import '../widgets/pass_text_fild.dart';
import '../widgets/text_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  Future<void> login() async {
    final navigator = Navigator.of(context);

    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
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
        return;
      }
    }

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
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
                "Log in",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Comfortaa-Bold",
                ),
              ),
              const SizedBox(height: 32),
              TextFormFieldWidget(
                hinText: "jane@example.com",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
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
                inputType: TextInputType.number,
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const RegistrePolicy()));
                },
                color: const BorderSide(color: Colors.black),
                text: "LOG IN",
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
