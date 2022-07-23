import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proje/core/extensions/context_extension.dart';

import '../../../../core/components/button/rounded_button.dart';
import '../../../../core/components/field/email_text_field.dart';
import '../../../../core/components/field/rounded_input_filed.dart';
import '../../../../core/components/header/header.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import 'mail_send_view.dart';

class ForgotPasswordView extends StatefulWidget {
  ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: context.screenHeight * 0.3,
                    child: HeaderWidget(
                        context.screenHeight * 0.3, true, Icons.password),
                  ),
                  SizedBox(height: context.screenHeight * 0.1),
                  buildTitleText(context),
                  SizedBox(height: context.screenHeight * 0.02),
                  buildBodyText(context),
                  SizedBox(height: context.screenHeight * 0.01),
                  EmailFieldWidget(controller: emailController),
                  //buildEmailTextField(),
                  SizedBox(height: context.screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildRememberText(context),
                      buildGestureDetector(context),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.03),
                  buildRoundedButton(context)
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back))),
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance
            .navigateToPage(NavigationConstants.LOGIN_VIEW, null);
      },
      child: Text(
        " " + LocaleKeys.login_login.tr(),
        style: TextStyle(
          color: context.colors.secondary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Text buildRememberText(BuildContext context) {
    return Text(
      LocaleKeys.forgot_remember_password.tr(),
      style: TextStyle(color: context.colors.secondary),
    );
  }

  Text buildBodyText(BuildContext context) {
    return Text(
      LocaleKeys.forgot_confirm_email.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(color: context.colors.primary),
    );
  }

  Text buildTitleText(BuildContext context) {
    return Text(
      LocaleKeys.forgot_your_password.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(color: context.colors.onPrimary, fontSize: 24),
    );
  }

  RoundedButton buildRoundedButton(BuildContext context) {
    return RoundedButton(
      text: LocaleKeys.forgot_reset_password.tr(),
      press: () async {
        sendMail();
      },
      color: context.colors.secondary,
    );
  }

  void sendMail() {
    final form = formKey.currentState!;
    if (form.validate()) {
      final email = emailController.text;
      if (kDebugMode) {
        print("$email adresine mail gönderildi.");
      }
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MailSendView(email: email),
      ));
    }
  }

  RoundedInputField buildEmailTextField() {
    return RoundedInputField(
      hintText: LocaleKeys.login_email.tr(),
      onChanged: (value) {},
      icon: Icons.mail,
    );
  }
}
