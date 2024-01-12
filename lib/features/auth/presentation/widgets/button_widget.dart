import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.color,
    this.minimumSize,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  final BorderSide color;
  final Color? backgroundColor;
  final Size? minimumSize;
  final String text;
  final Function()? onPressed;
  final TextStyle? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: textColor,
        ),
        style: ElevatedButton.styleFrom(
          // shadowColor: AppColors.backgroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          side: const BorderSide(width: 2, color: Colors.black),
          elevation: 1,
          minimumSize: minimumSize,
        ));
  }
}
