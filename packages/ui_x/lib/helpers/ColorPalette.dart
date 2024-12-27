import 'package:flutter/material.dart';
export 'theme/ColorPaletteGerman.dart';



/// Neutral Colors
const Color kcWhite = Color(0xffffffff);
const Color kcOffWhite = Color(0xfff1f1f1);
const Color kcBlack = Color(0xff151515);

/// GRAY Colors
const Color kcGray = Color(0xffcdcdcd);

/// All Dark Colors
const Color kcDark = Color(0xFF414141);
const Color kcDarkAlt = Color(0xFF7E7E7E);
const Color kcDarker = Color(0xFF252929);
const Color kcDarkest = Color(0xFF191C1C);
const Color kcDarkGray = Color(0xFF657a97);

/// Theme colors
const Color kcPrimary = Color(0xff3b77dc);
const Color kcPrimaryLight = Color(0xffff8179);
const Color kcSecondary = Color(0xFF252929);
const Color kcAccent = Color(0xffdddd2e);
const Color kcDanger = Color(0xFFEB3349);
const Color kcInfo = Color(0xff3b77dc);
const Color kcInfoDark = Color(0xff1958b6);
const Color kcWarning = Color(0xFFF59E0B);
const Color kcGreen = Color(0xFF4caf26);
const Color kcLightGreen = Color(0xFFe7f6ea);
const Color kcDarkGreen = Color(0xFF039556);
const Color kcLightPink = Color(0xFFfff1ed);
const Color kcBackground = Color(0xFFeff3f8);
const Color kcButton = Color(0xFFff6d38);


Color getContrastColor(Color color) {
  int d = 0;

// Counting the perceptive luminance - human eye favors green color...
  double luminance = (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

  if (luminance > 0.7)
    d = 0; // bright colors - black font
  else
    d = 255; // dark colors - white font

  return Color.fromARGB(color.alpha, d, d, d);
}
