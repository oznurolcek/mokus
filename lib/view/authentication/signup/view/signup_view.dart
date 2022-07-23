import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proje/core/extensions/context_extension.dart';
import 'package:proje/service/auth.dart';

import '../../../../core/components/button/rounded_button.dart';
import '../../../../core/components/field/rounded_input_filed.dart';
import '../../../../core/components/field/rounded_password_field.dart';
import '../../../../core/components/header/header.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../login/components/already_have_an_account.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

AuthService _authService = AuthService();
TextEditingController _nickName = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Stack(children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: context.screenHeight * 0.25,
                    child: HeaderWidget(context.screenHeight * 0.25, true,
                        Icons.app_registration),
                  ),
                  Text(
                    LocaleKeys.login_signup.tr(),
                    style: context.textTheme.headline5
                        ?.copyWith(color: context.colors.onPrimary),
                  ),
                  SizedBox(height: context.screenHeight * 0.03),
                  buildNicknameInputField(),
                  buildEmailInputField(),
                  buildPasswordField(),
                  buildRoundedButton(context),
                  SizedBox(height: context.screenHeight * 0.03),
                  buildAccountCheck(),
                  SizedBox(height: context.screenHeight * 0.1),
                ]),
          ),
        ),
        Positioned(
            top: 50,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
      ]),
    );
  }

  RoundedPasswordField buildPasswordField() {
    return RoundedPasswordField(
      onChanged: (value) {
        setState(() {
          _pass.text = value;
        });
      },
    );
  }

  AlreadyHaveAnAccountCheck buildAccountCheck() {
    return AlreadyHaveAnAccountCheck(
      login: false,
      press: () {
        NavigationService.instance
            .navigateToPage(NavigationConstants.LOGIN_VIEW, null);
      },
    );
  }

  RoundedButton buildRoundedButton(BuildContext context) {
    return RoundedButton(
      text: LocaleKeys.login_signup.tr(),
      press: () {
        _authService
            .createUser(_nickName.text, _email.text, _pass.text)
            .then((value) {
          return NavigationService.instance
              .navigateToPage(NavigationConstants.NAVIGATION_BAR_VIEW, null);
        });

        buildFlashMessage(context);
      },
      color: context.colors.secondary,
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildFlashMessage(
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
                color: Color.fromARGB(255, 93, 241, 106),
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
                          LocaleKeys.signup_flash_message.tr(),
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
                  color: Color.fromARGB(255, 102, 216, 106),
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
                    color: Color.fromARGB(255, 102, 216, 106),
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

  RoundedInputField buildEmailInputField() {
    return RoundedInputField(
      controller: _email,
      hintText: LocaleKeys.login_email.tr(),
      onChanged: (value) {},
      icon: Icons.mail,
    );
  }

  RoundedInputField buildNicknameInputField() {
    return RoundedInputField(
        controller: _nickName,
        hintText: LocaleKeys.login_nickname.tr(),
        onChanged: (value) {},
        icon: Icons.person);
  }
}
