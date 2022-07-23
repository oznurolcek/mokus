import 'package:flutter/material.dart';
import 'package:proje/core/extensions/context_extension.dart';

class RoundedButton extends StatelessWidget {
  final Function() press;
  final String text;
  final Color? textColor;
  final Color color;
  const RoundedButton({
    Key? key,
    this.textColor = Colors.white,
    required this.text,
    required this.press,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: context.screenWidth * 0.8,
      child: ClipRRect(
        borderRadius: context.buttonBorderRadius,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: context.buttonPadding,
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}