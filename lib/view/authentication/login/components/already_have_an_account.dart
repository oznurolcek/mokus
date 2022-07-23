import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proje/core/extensions/context_extension.dart';
import 'package:proje/core/init/lang/locale_keys.g.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function() press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? LocaleKeys.login_singup_text.tr()
              : LocaleKeys.login_singup_text2.tr(),
          style: TextStyle(color: context.colors.secondary),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? LocaleKeys.login_signup.tr() : LocaleKeys.login_login.tr(),
            style: TextStyle(
              color: context.colors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}