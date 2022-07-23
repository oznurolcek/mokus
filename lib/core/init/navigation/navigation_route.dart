import 'package:flutter/material.dart';

import '../../../view/about/about_view.dart';
import '../../../view/authentication/forgotpassword/view/forgot_password_view.dart';
import '../../../view/authentication/forgotpassword/view/mail_send_view.dart';
import '../../../view/authentication/login/view/login_view.dart';
import '../../../view/authentication/onboarding/view/onboarding_view.dart';
import '../../../view/authentication/signup/view/signup_view.dart';
import '../../../view/authentication/todos/view/todo_view.dart';
import '../../../view/errorpage/error_page_view.dart';
import '../../../view/help_support/help_support_view.dart';
import '../../../view/navigationbar/view/navigation_bar.dart';
import '../../../view/settings/view/settings_view.dart';
import '../../../view/timer/view/timer_view.dart';
import '../../constants/navigation/navigation_constant.dart';


class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

    Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT_VIEW:
        return normalNavigate(const OnboardingView());
      case NavigationConstants.ONBOARDING_VIEW:
        return normalNavigate(const OnboardingView());
      case NavigationConstants.TIMER_VIEW:
        return normalNavigate(TimerView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConstants.SIGNUP_VIEW:
        return normalNavigate(const SignupView());
      case NavigationConstants.FORGOT_PASSWORD_VIEW:
        return normalNavigate(ForgotPasswordView());
      case NavigationConstants.MAIL_SEND_VIEW:
        return normalNavigate(MailSendView(
          email: '',
        ));
      case NavigationConstants.NAVIGATION_BAR_VIEW:
        return normalNavigate(const NavigationBarView());
      case NavigationConstants.SETTINGS_VIEW:
        return normalNavigate(const SettingsView());
      case NavigationConstants.TODO_VIEW:
        return normalNavigate(TodoView());
      case NavigationConstants.ABOUT_VIEW:
        return normalNavigate(const AboutView());
      case NavigationConstants.HELP_SUPPORT_VIEW:
        return normalNavigate(const HelpSupportView());
      case NavigationConstants.ERROR_PAGE_VIEW:
        return normalNavigate(const ErrorPageView());
      default:
        return MaterialPageRoute(
          builder: (context) => const Center(child: Text("Not Found Page")),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}