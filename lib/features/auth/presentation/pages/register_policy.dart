import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photo/features/main/presentation/pages/home/home.dart';
import '../../../../config/helpers/validators.dart';
import '../../../../core/constants/snack_bar.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_form_widget.dart';

class RegistrePolicy extends StatefulWidget {
  const RegistrePolicy({super.key});

  @override
  State<RegistrePolicy> createState() => _RegistrePolicyState();
}

class _RegistrePolicyState extends State<RegistrePolicy> {
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final emailController = TextEditingController();

  bool checkedValue = true;
  bool isCompleted = false;
  bool isValidatePassword = false;
  bool isValidateEmail = false;

  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    print(isEmailVerified);

    if (isEmailVerified) timer?.cancel();
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));

      setState(() => canResendEmail = true);
    } catch (e) {
      print(e);
      if (mounted) {
        SnackBarService.showSnackBar(
          context,
          '$e',
          //'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const DiscoverPage()
      : Scaffold(
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
                    "Register",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Comfortaa-Bold",
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormFieldWidget(
                    hinText: "the_jane",
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
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget(
                    onPressed: () {
                      canResendEmail ? sendVerificationEmail : null;
                    },
                    color: const BorderSide(color: Colors.black),
                    text: "SIGN UP",
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 52),
                    textColor: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "By signing up, you agree to Photo’s Terms of Service and Privacy Policy.",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
