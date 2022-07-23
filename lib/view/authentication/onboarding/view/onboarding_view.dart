import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:proje/core/extensions/context_extension.dart';

import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: IntroductionScreen(
            pages: [
              PageViewModel(
                  title: LocaleKeys.onboard_title1.tr(),
                  body: LocaleKeys.onboard_body1.tr(),
                  image: Center(
                    child: SvgPicture.asset(
                      ImageConstants.instance.onboardImage1,
                      width: context.screenWidth / 3,
                      height: context.screenHeight / 3,
                    ),
                  ),
                  decoration: getPageDecoration(context)),
               
               PageViewModel(
                  title: LocaleKeys.onboard_title2.tr(),
                  body: LocaleKeys.onboard_body2.tr(),
                  image: Center(
                    child: SvgPicture.asset(
                      ImageConstants.instance.onboardImage2,
                      width: context.screenWidth / 3,
                      height: context.screenHeight / 3,
                    ),
                  ),
                  decoration: getPageDecoration(context)),
              PageViewModel(
                  title: LocaleKeys.onboard_title3.tr(),
                  body: LocaleKeys.onboard_body3.tr(),
                  image: Center(
                    child: SvgPicture.asset(
                      ImageConstants.instance.onboardImage3,
                      width: context.screenWidth / 3,
                      height: context.screenHeight / 3,
                    ),
                  ),
                  decoration: getPageDecoration(context))
            ],
            done: Text(
              LocaleKeys.onboard_continuePage.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onDone: () => goToHome(context),
            showSkipButton: true,
            skip: Text(LocaleKeys.onboard_skip.tr()),
            next: const Icon(Icons.arrow_right),
            dotsDecorator: getDotDecoration(context),
            globalBackgroundColor: context.colors.onSecondary,
            doneStyle: TextButton.styleFrom(primary: Colors.white),
            skipStyle: TextButton.styleFrom(primary: Colors.white),
            nextStyle: TextButton.styleFrom(primary: Colors.white),
          ),
        ),
      );

  Future<void> goToHome(context) async {
    int isViewed = 1;
    await LocaleManager.instance!
        .setIntValue(PreferencesKeys.ISFIRSTOPEN, isViewed);
    NavigationService.instance
        .navigateToPageClear(NavigationConstants.NAVIGATION_BAR_VIEW, null);
  }

  PageDecoration getPageDecoration(BuildContext context) => PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: context.colors.onPrimary),
        bodyTextStyle: TextStyle(fontSize: 20, color: context.colors.primary),
        //descriptionPadding: context.paddingAllDefaultScreen.copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(context.normalValue),
        pageColor: context.colors.onSecondary
      );

  DotsDecorator getDotDecoration(BuildContext context) => DotsDecorator(
        color: context.colors.primary,
        activeColor: context.colors.primary,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
}
