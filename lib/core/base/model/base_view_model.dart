import 'package:flutter/cupertino.dart';
import 'package:proje/core/init/navigation/navigation_service.dart';

import '../../init/cache/locale_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;
  NavigationService navigation = NavigationService.instance;
  LocaleManager? localeManager = LocaleManager.instance;

  void setContext(BuildContext context);
  void init();
  
}