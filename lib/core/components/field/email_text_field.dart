import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:proje/core/extensions/context_extension.dart';

import '../../init/lang/locale_keys.g.dart';

class EmailFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  const EmailFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  void onListen() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);

    @override
    // ignore: unused_element
    void dispose() {
      widget.controller.removeListener(onListen);
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: LocaleKeys.login_email.tr(),
        prefixIcon: Icon(Icons.mail,
          color: context.colors.primary,
        ),
        suffixIcon: widget.controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => widget.controller.clear(),
              ),
      ),
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? LocaleKeys.forgot_valid_email.tr()
          : null,
    );
  }
}
