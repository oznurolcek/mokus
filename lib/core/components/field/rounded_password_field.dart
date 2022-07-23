import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proje/core/components/field/text_field_container.dart';
import 'package:proje/core/extensions/context_extension.dart';

import '../../init/lang/locale_keys.g.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isObscure,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          fillColor: context.colors.primary,
          hintText: LocaleKeys.login_password.tr(),
          icon: Icon(
            Icons.lock,
            color: context.colors.onPrimary,
          ),
          suffixIcon: buildSuffixGesture(context),
          border: InputBorder.none,
        ),
      ),
    );
  }

  GestureDetector buildSuffixGesture(BuildContext context) {
    return GestureDetector(
      onTap: _changeObscure,
      child: buildSuffixIcon(context),
    );
  }

  Icon buildSuffixIcon(BuildContext context) {
    return Icon(
      isObscure ? Icons.visibility_off : Icons.visibility,
      color: context.colors.onPrimary,
    );
  }

  void _changeObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }
}