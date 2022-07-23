import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proje/core/extensions/context_extension.dart';
import 'package:proje/core/init/lang/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enums/app_theme_enum.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/constants/navigation/navigation_constant.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../service/auth.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  AuthService _authService = AuthService();
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          _modeButton(context, isDarkMode),
        ],
      ),
      body: Padding(
        padding: context.paddingHorizontalDefaultScreen,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      _buildLottie(context),
                    ],
                  ),
                ),
              ],
            ),
            _profileListItems(),
            Image.asset(
              ImageConstants.instance.logo,
              width: context.screenWidth * 0.35,
            )
          ],
        ),
      ),
    );
  }

  IconButton _modeButton(BuildContext context, bool themeMode) {
    return IconButton(
      onPressed: () {
        changeMode(themeMode, context);
      },
      icon: Icon(
        Icons.light_mode,
        size: context.iconSize,
      ),
    );
  }

  void changeTheme(AppThemes mode, BuildContext context) {
    Provider.of<ThemeNotifier>(context, listen: false).changeValue(mode);
  }

  void changeMode(bool value, BuildContext context) {
    if (value) {
      setState(() {
        isDarkMode = false;
      });
      changeTheme(AppThemes.LIGHT, context);
    } else {
      setState(() {
        isDarkMode = true;
      });
      changeTheme(AppThemes.DARK, context);
    }

    LocaleManager.instance!
        .setStringValue(PreferencesKeys.ISDARKMODE, isDarkMode.toString());
  }

  Expanded _profileListItems() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              buildChangeLanguageDialog();
            },
            child: ProfileListItem(
              icon: Icons.language,
              text: LocaleKeys.settings_change_language.tr(),
              onTap: () {},
            ),
          ),
          GestureDetector(
             onTap: () {
              NavigationService.instance
                  .navigateToPage(NavigationConstants.HELP_SUPPORT_VIEW, null);
            },
            child: ProfileListItem(
              icon: Icons.question_mark,
              text: LocaleKeys.settings_help_support.tr(),
              onTap: () {
                print("yardım");
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              NavigationService.instance
                  .navigateToPage(NavigationConstants.ABOUT_VIEW, null);
            },
            child: ProfileListItem(
              icon: Icons.history,
              text: LocaleKeys.settings_about.tr(),
              onTap: () {
                print("hakkımızda");
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _authService.signOut();
              NavigationService.instance
                  .navigateToPage(NavigationConstants.NAVIGATION_BAR_VIEW, null);
            },
            child: ProfileListItem(
              icon: Icons.logout,
              text: LocaleKeys.settings_logout.tr(),
              onTap: () {},
              hasNavigation: false,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildChangeLanguageDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: context.buttonBorderRadius),
        title: Center(
          child: Text(
            LocaleKeys.settings_change_language_dialog.tr(),
            style: TextStyle(color: context.colors.secondary),
          ),
        ),
        actions: [
          Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      context.setLocale(const Locale('tr', 'TR'));
                    });
                    buildDialog();
                  },
                  child: Text(
                    LocaleKeys.settings_turkish.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: context.colors.primary),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      context.setLocale(const Locale('en', 'US'));
                    });
                    buildDialog();
                  },
                  child: Text(
                    LocaleKeys.settings_english.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: context.colors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.settings_dialog_title.tr()),
        content: Text(LocaleKeys.settings_dialog_content.tr()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              LocaleKeys.okay.tr(),
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  LottieBuilder _buildLottie(BuildContext context) {
    return Lottie.asset(
      ImageConstants.instance.settingsLottie,
      animate: true,
      height: context.screenHeight * 0.3,
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  // ignore: prefer_typing_uninitialized_variables
  final text;
  final bool hasNavigation;
  final Function() onTap;
  const ProfileListItem({
    Key? key,
    required this.icon,
    this.text,
    this.hasNavigation = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.055,
      margin: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.04)
          .copyWith(bottom: context.screenHeight * 0.02),
      padding: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.defaultRadius),
        color: context.colors.onBackground,
      ),
      child: Row(children: <Widget>[
        Icon(icon),
        SizedBox(width: context.screenWidth * 0.025),
        Text(
          text,
          style: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500, color: context.colors.onPrimary),
        ),
        const Spacer(),
        if (hasNavigation) const Icon(Icons.arrow_right),
      ]),
    );
  }
}
