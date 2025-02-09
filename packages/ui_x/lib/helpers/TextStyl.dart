import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

class TextStyl {
  static TextStyle? get heading1 {
    return Theme.of(Get.context!).textTheme.headline1;
  }

  static TextStyle? get heading2 {
    return Theme.of(Get.context!).textTheme.headline2;
  }

  static TextStyle? get heading3 {
    return Theme.of(Get.context!).textTheme.headline3;
  }

  static TextStyle? get title {
    return Theme.of(Get.context!).textTheme.headline2?.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle? get subtitle {
    return Theme.of(Get.context!).textTheme.headline3?.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: kcDark.withOpacity(0.75),
    );
  }

  static TextStyle? get body {
    return Theme.of(Get.context!).textTheme.bodyText1?.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle? get bodySm {
    return Theme.of(Get.context!).textTheme.bodyText1?.copyWith(fontSize: 14.0);
  }
  static TextStyle? get bodyXs {
    return Theme.of(Get.context!).textTheme.bodyText1?.copyWith(fontSize: 12.0);
  }
  static TextStyle? get bodyBd {
    return Theme.of(Get.context!).textTheme.bodyText2?.copyWith(fontSize: 14.0,fontFamily: "assets/font/Quicksand-Bold.ttf");
  }

  static TextStyle? get caption {
    return Theme.of(Get.context!).textTheme.caption;
  }

  static TextStyle? get button {
    return Theme.of(Get.context!).textTheme.button?.copyWith(fontSize: 14.0, fontWeight: FontWeight.w600, height: 1.07);
  }

  static TextStyle? get label {
    return Theme.of(Get.context!).textTheme.button?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.0);
  }

}
