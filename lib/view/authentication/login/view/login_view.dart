import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proje/core/constants/image/image_constants.dart';
import 'package:proje/core/extensions/context_extension.dart';
import 'package:proje/service/auth.dart';

import '../../../../core/components/button/rounded_button.dart';
import '../../../../core/components/field/rounded_input_filed.dart';
import '../../../../core/components/field/rounded_password_field.dart';
import '../../../../core/components/header/header.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../components/already_have_an_account.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthService _authService = AuthService();
  TextEditingController _emailCont = TextEditingController();
  TextEditingController _passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: context.screenHeight * 0.3,
                child: HeaderWidget(
                    context.screenHeight * 0.3, true, Icons.login_outlined),
              ),
              Text(
                LocaleKeys.login_login.tr(),
                style: context.textTheme.headline5
                    ?.copyWith(color: context.colors.onPrimary),
              ),
              SizedBox(height: context.screenHeight * 0.03),
              buildEmailInputField(),
              buildPasswordField(),
              buildGestureDetector(context),
              buildLoginButton(context),
              SizedBox(height: context.screenHeight * 0.03),
              buildAccountCheck(),
              SizedBox(
                height: context.screenHeight * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance
            .navigateToPage(NavigationConstants.FORGOT_PASSWORD_VIEW, null);
      },
      child: Text(
        LocaleKeys.forgot_your_password.tr(),
        style: TextStyle(
          color: context.colors.secondary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  AlreadyHaveAnAccountCheck buildAccountCheck() {
    return AlreadyHaveAnAccountCheck(
      press: () {
        NavigationService.instance
            .navigateToPage(NavigationConstants.SIGNUP_VIEW, null);
      },
    );
  }

  RoundedInputField buildEmailInputField() {
    return RoundedInputField(
      controller: _emailCont,
      hintText: LocaleKeys.login_email.tr(),
      onChanged: (value) {},
      icon: Icons.person,
    );
  }

  RoundedPasswordField buildPasswordField() {
    return RoundedPasswordField(
      onChanged: (value) {
        setState(() {
          _passCont.text = value;
        });
      },
    );
  }

  RoundedButton buildLoginButton(BuildContext context) {
    return RoundedButton(
      text: LocaleKeys.login_login.tr(),
      press: () {
        AuthService()
            .signIn(_emailCont.text, _passCont.text)
            .then((value) => NavigationService.instance
            .navigateToPage(NavigationConstants.NAVIGATION_BAR_VIEW, null));

        buildFlashMassege(context);
      },
      color: context.colors.secondary,
    );
  }

  

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildFlashMassege(
      BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: context.paddingAllDefaultScreen,
              height: context.screenHeight * 0.09,
              decoration: const BoxDecoration(
                color: Color(0xFF5DF16A),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          LocaleKeys.login_login_flash_message.tr(),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  ImageConstants.instance.flashBubbles,
                  height: 48,
                  width: 50,
                  color: Color(0xFF66D86A),
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstants.instance.flashBubbles2,
                    height: 40,
                    color: Color(0xFF66D86A),
                  ),
                  Positioned(
                    top: 10,
                    child: SvgPicture.asset(
                      ImageConstants.instance.flashClose,
                      height: 16,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  
}
