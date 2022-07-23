class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    return _instance ??= ColorSchemeLight._init();
  }

  ColorSchemeLight._init();
}