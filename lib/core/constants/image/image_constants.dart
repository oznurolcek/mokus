class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  //png
  String get logo => toPng("mokus");

  //json
  String get contactMail => toJson("contact_mail");
  String get settingsLottie => toJson("settings");
  String get growing => toJson("growing");
  String get about => toJson("about");
  String get helpSupport => toJson("helpandsupport");
  String get sandClock => toJson("sandclock");
  String get lock => toJson("lock");

  //svg
  String get flashBubbles => toSvg("bubbles");
  String get flashBubbles2 => toSvg("bubbles2");
  String get flashClose => toSvg("close");
  String get onboardImage1 => toSvg("ic_onboard_1");
  String get onboardImage2 => toSvg("ic_onboard_2");
  String get onboardImage3 => toSvg("ic_onboard_3");


  String toPng(String name) => "assets/image/png/$name.png";
  String toSvg(String name) => "assets/image/svg/$name.svg";
  String toJpeg(String name) => "assets/image/jpeg/$name.jpeg";
  String toJpg(String name) => "assets/image/jpg/$name.jpg";
  String toJson(String name) => "assets/json/$name.json";

}