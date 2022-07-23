import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/core/extensions/context_extension.dart';
import 'package:proje/core/init/lang/locale_keys.g.dart';
import 'package:proje/view/authentication/todos/view/todo_view.dart';
import 'package:proje/view/errorpage/error_page_view.dart';
import 'package:proje/view/settings/view/settings_view.dart';

import '../../authentication/login/view/login_view.dart';
import '../../timer/view/timer_view.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  int index = 0;

  final screens = [
    TimerView(),
    FirebaseAuth.instance.currentUser == null ? ErrorPageView() : TodoView(),
    FirebaseAuth.instance.currentUser == null ? LoginView() : SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: context.colors.primary,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        child: NavigationBar(
          height: context.screenHeight * 0.09,
          backgroundColor: const Color.fromARGB(77, 255, 251, 251),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          animationDuration: Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.timer_outlined,
                color: context.colors.onPrimary,
              ),
              selectedIcon: Icon(
                Icons.timer,
                color: context.colors.onSecondary,
              ),
              label: LocaleKeys.navigation_bar_focus.tr(),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.note_add_outlined,
                color: context.colors.onPrimary,
              ),
              selectedIcon: Icon(
                Icons.note_add,
                color: context.colors.onSecondary,
              ),
              label: LocaleKeys.navigation_bar_todo.tr(),
            ),
            NavigationDestination(
                icon: FirebaseAuth.instance.currentUser == null
                    ? Icon(
                        Icons.home,
                        color: context.colors.onPrimary,
                      )
                    : Icon(
                        Icons.settings,
                        color: context.colors.onPrimary,
                      ),
                selectedIcon: FirebaseAuth.instance.currentUser == null
                    ? Icon(
                        Icons.home_outlined,
                        color: context.colors.onSecondary,
                      )
                    : Icon(
                        Icons.settings_outlined,
                        color: context.colors.onSecondary,
                      ),
                label: FirebaseAuth.instance.currentUser == null
                    ? LocaleKeys.login_login.tr()
                    : LocaleKeys.navigation_bar_settings.tr()),
          ],
        ),
      ),
    );
  }
}
