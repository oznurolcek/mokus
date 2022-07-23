import 'package:flutter/material.dart';
import 'package:proje/core/components/field/text_field_container.dart';
import 'package:proje/core/extensions/context_extension.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: context.colors.primary,
          icon: Icon(
            icon,
            color: context.colors.onPrimary,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}