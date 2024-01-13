import 'package:flutter/material.dart';
import 'package:photo/features/main/presentation/widgets/button_bar_widget.dart';
import '../../../../config/helpers/validators.dart';
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const MainPage()));
                },
                color: const BorderSide(color: Colors.black),
                text: "SIGN UP",
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 52),
                textColor: TextStyle(color: Colors.white),
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
}
