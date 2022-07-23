import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proje/core/extensions/context_extension.dart';

import '../../core/constants/image/image_constants.dart';
import '../../core/init/lang/locale_keys.g.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              ImageConstants.instance.about,
              animate: true,
              height: context.screenHeight * 0.3,
            ),
            SizedBox(height: context.screenHeight * 0.1),
            Text(
              LocaleKeys.about_text.tr(),
              style: TextStyle(
                color: context.colors.secondary,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: context.screenHeight * 0.1),
            Image.asset(
              ImageConstants.instance.logo,
              width: context.screenWidth * 0.35,
            ),
          ],
        ),
      ),
    );
  }
}
