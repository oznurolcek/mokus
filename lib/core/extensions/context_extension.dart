import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;

  double get lowValue => screenHeight * 0.01;
  double get normalValue => screenHeight * 0.02;
  double get mediumValue => screenHeight * 0.04;
  double get highValue => screenHeight * 0.1;
}

extension PaddingExtensionScreenDefault on BuildContext {
  EdgeInsets get paddingHorizontalDefaultScreen =>
      const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get paddingVerticalDefaultScreen =>
      const EdgeInsets.symmetric(vertical: 16);
  EdgeInsets get paddingAllDefaultScreen => const EdgeInsets.all(16);
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionVertical on BuildContext {
  EdgeInsets get paddingVerticalLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingVerticalNormal =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingVerticalMedium =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingVerticalHigh =>
      EdgeInsets.symmetric(vertical: highValue);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingButtonExtension on BuildContext {
  EdgeInsets get buttonPadding =>
      const EdgeInsets.symmetric(vertical: 20, horizontal: 40);
}

extension ButtonBorderRadius on BuildContext {
  BorderRadius get buttonBorderRadius => BorderRadius.circular(32);
}

extension DefaultBorderRadius on BuildContext {
  double get defaultRadius => 24;
}

extension IconSizeExtention on BuildContext {
  double get iconSize => 24;
}
