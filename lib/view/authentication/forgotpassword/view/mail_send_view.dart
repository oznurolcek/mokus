import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proje/core/extensions/context_extension.dart';

import '../../../../core/components/button/rounded_button.dart';
import '../../../../core/components/header/header.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class MailSendView extends StatefulWidget {
  final String email;
  MailSendView({Key? key, required this.email}) : super(key: key);

  @override
  State<MailSendView> createState() => _MailSendViewState();
}

String userMail = "";

class _MailSendViewState extends State<MailSendView> {
  @override
  void initState() {
    super.initState();

    setState(() {
      userMail = widget.email;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: context.screenHeight * 0.25,
                  child: HeaderWidget(context.screenHeight * 0.25, true, Icons.mail),
                ),
                SizedBox(height: context.screenHeight * 0.03),
                buildTitleText(context),
                SizedBox(height: context.screenHeight * 0.03),
                buildBodyText(context, widget.email),
                SizedBox(height: context.screenHeight * 0.03),
                buildLottie(context),
                SizedBox(height: context.screenHeight * 0.02),
                buildRoundedButton(context),
                SizedBox(height: context.screenHeight * 0.03),
                buildTryAgainText(context),
                buildGestureDetector(context)
              ]
            ),
         ),
       ),
    );
  }

  Text buildTryAgainText(BuildContext context) {
  return Text(
    LocaleKeys.forgot_didnt_receive_mail.tr(),
    style: TextStyle(color: context.colors.onPrimary),
  );
}

  GestureDetector buildGestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: sendMailAgain,
      child: Text(
        LocaleKeys.try_again.tr(),
        style: TextStyle(
          color: context.colors.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  RoundedButton buildRoundedButton(BuildContext context) {
    return RoundedButton(
      text: LocaleKeys.login_login.tr(),
      press: () async {
        NavigationService.instance
            .navigateToPage(NavigationConstants.LOGIN_VIEW, null);
      },
      color: context.colors.secondary,
    );
  }

  LottieBuilder buildLottie(BuildContext context) {
    return Lottie.network(
      "https://assets5.lottiefiles.com/packages/lf20_funnd7gk.json",
      animate: true,
      height: context.screenHeight * 0.3,
      //width: context.screenWidth * 0.4,
    );
  }

  Text buildBodyText(BuildContext context, String email) {
    return Text(
      email + LocaleKeys.forgot_mail_send_text.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(color: context.colors.primary),
    );
  }

  Text buildTitleText(BuildContext context) {
    return Text(
      LocaleKeys.forgot_mail_send.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(color: context.colors.secondary, fontSize: 24),
    );
  }

  void sendMailAgain() {
    if (kDebugMode) {
      print(userMail + " adresine mail gönderildi. ");
    }
  }
}