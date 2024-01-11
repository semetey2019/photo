import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? hinText;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final bool? isError;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.isPasswordField,
    this.hinText,
    this.validator,
    this.inputType,
    this.onChanged,
    this.isError,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isFirstError = true;
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        cursorColor: Colors.black,
        validator: widget.validator,
        onChanged: widget.onChanged,
        obscureText: widget.isPasswordField == true ? _obsecureText : false,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hinText,
          errorStyle: const TextStyle(fontSize: 0),
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ));
  }
}
