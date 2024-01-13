import 'package:flutter/material.dart';
import 'package:photo/features/auth/presentation/pages/register_policy.dart';

import '../../../../config/helpers/validators.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
