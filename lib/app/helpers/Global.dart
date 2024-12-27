import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';
import 'package:vibration/vibration.dart';

import '../../config/Config.dart';
import '../shared/controllers/AppController.dart';
import '../shared/controllers/AuthState.dart';

///======================================
/// Get Instance of [AuthState]
///======================================
AuthState authState = AuthState.instance;
AuthState auth = AuthState.instance;
AppController appController = AppController.instance;

///======================================
/// Get storage Helper
///======================================
GetStorage storage = new GetStorage();

///======================================
/// Get screen size helper
///======================================
Size screen = Get.size;

///======================================
/// Image Helper
///======================================
String image(name) {
  return "assets/icons/$name";
}

///======================================
/// Icon Helper
///======================================
String assetIcon(name) {
  return "assets/icons/$name";
}

///======================================
/// Check current route
///======================================
bool routeIs(name) {
  return Get.routing.current == name;
}

///======================================
/// Console Logger
///======================================
var log = Logger(
  printer: PrettyPrinter(),
);

///======================================
/// Generate and get MaterialColor From a Color
///======================================
MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: _tintColor(color, 0.9),
    100: _tintColor(color, 0.8),
    200: _tintColor(color, 0.6),
    300: _tintColor(color, 0.4),
    400: _tintColor(color, 0.2),
    500: color,
    600: _shadeColor(color, 0.1),
    700: _shadeColor(color, 0.2),
    800: _shadeColor(color, 0.3),
    900: _shadeColor(color, 0.4),
  });
}

int _tintValue(int value, double factor) => max(0, min((value + ((255 - value) * factor)).round(), 255));

Color _tintColor(Color color, double factor) =>
    Color.fromRGBO(_tintValue(color.red, factor), _tintValue(color.green, factor), _tintValue(color.blue, factor), 1);

int _shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1,
    );

///======================================
/// Formatted DateTime
///======================================
extension DateExt on DateTime {
  String formattedDateTime(String format) {
    return Jiffy(this).format(format);
  }
}

///======================================
/// Formatted Date Extension
///======================================
extension Date on DateFormat {
  String formatDate(DateTime date, String format) {
    return DateFormat(format).format(date);
  }
}

///======================================
/// Formatted Time Extension
///======================================
extension TimeExt on TimeOfDay {
  String formattedTime(String format) {
    return Jiffy(this).format(format);
  }
}

///======================================
/// Formatted Date
///======================================

String formattedDate(String date) {
  Map dateFormat = {
    "MMMM do yyyy, h:mm:ss a": 1,
    "MMM do yy": 2,
    "dd, MMM yyyy": 3,
    "yyyy-MM-dd": 4,
  };
  var dateFormatted = dateFormat.keys.firstWhere((k) => dateFormat[k] == Config.dateFormatted, orElse: () => "null");
  print(dateFormatted);
  return Jiffy(date).format(dateFormatted.toString());
}

///======================================
/// Formatted Date
///======================================
String formattedTime(String time) {
  Map timeFormat = {
    "h:mm:ss a": 1,
    "h:mm:ss": 2,
    "h:mm": 3,
  };
  var timeFormatted = timeFormat.keys.firstWhere((k) => timeFormat[k] == Config.dateFormatted, orElse: () => "null");
  return Jiffy(time).format(timeFormatted.toString());
}

///======================================
/// Formatted Currency Symbol
///======================================
String formatCurrencySymbol(String countryName) {
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: countryName);
  return format.currencySymbol;
}

///======================================
/// Formatted Currency
///======================================
String formattedCurrency(double amount, String countryName) {
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: countryName);
  var formatSymbol = format.currencySymbol;
  var number = NumberFormat.currency(name: formatSymbol).format(double.parse(amount.toStringAsFixed(0)));
  return number;
}

///======================================
/// Formatted Amount
///======================================
String formattedTotalAmount(dynamic amount) {
  if (amount.length < 4) {
    return amount;
  } else if (amount.length >= 4 && amount.length < 6) {
    return (double.parse(amount) / 1000).toStringAsFixed(0) + "K";
  } else if (amount.length >= 6 && amount.length < 8) {
    return (double.parse(amount) / 100000).toStringAsFixed(0) + "L";
  } else {
    return (double.parse(amount) / 10000000).toStringAsFixed(0) + "Cr";
  }
}

///======================================
/// Formatted Amount
///======================================
String formattedAmount(dynamic amount) {
  var formatter = NumberFormat('##,##,##0');
  return (formatter.format(double.parse(amount.toString())));
}

///======================================
/// Random Point Generate
///======================================
num rand([int min = 0, int max = 10]) {
  return min + Random().nextInt((max + 1) - min);
}

///======================================
/// Audio Sound Player
///======================================
void playAudio(String action) async {
  await appController.player!.setAsset('assets/audio/$action.mp3');
  await appController.player!.play();
}

///======================================
/// Vibration
///======================================
void playVibration() {
  Vibration.vibrate();
  // HapticFeedback.vibrate();
}

///======================================
/// Int, Double, String Parse
///======================================

int parseInt(int number) {
  return int.parse(number.toString());
}

double parseDouble(double number) {
  return double.parse(number.toString());
}

String parseString(String number) {
  return number;
}


// Convenient method for easily display a top modal
// Here we can customize more
Future<T?> showTopModalSheet<T>(BuildContext context, Widget child,
    {bool barrierDismissible = true}) {
  return showGeneralDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: const Duration(milliseconds: 250),
    barrierLabel: MaterialLocalizations.of(context).dialogLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, _, __) => child,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: SlideTransition(
          child: Column(
            children: [
              Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [child],
                ),
              )
            ],
          ),
          position: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)
              .drive(
              Tween<Offset>(begin: const Offset(0, -1.0), end: Offset.zero)),
        ),
      );
    },
  );
}