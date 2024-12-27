import 'package:google_fonts/google_fonts.dart';
import '../app/modules/Home/route/HomeRoutes.dart';

enum AuthMode { EMAIL_PASSWORD, PHONE_PASSWORD, EMAIL_OTP, PHONE_OTP, EMAIL_PASSWORD_OTP, PHONE_PASSWORD_OTP }
class Config {
  ///======================================
  /// Is Auth Required In App
  ///======================================
  static bool authRequired = true;

  ///======================================
  /// Is Auth Required In App
  ///======================================
  static String themeMode = 'blue';

  ///======================================
  /// Default Login With Password, Is Auth Required OTP In App
  ///======================================
  static AuthMode authMode = AuthMode.EMAIL_PASSWORD;

  /// Misc
  static bool get hasPasswordLogin =>
      authMode == AuthMode.EMAIL_PASSWORD || authMode == AuthMode.EMAIL_PASSWORD_OTP || authMode == AuthMode.PHONE_PASSWORD || authMode == AuthMode.PHONE_PASSWORD_OTP;

  static bool get hasPhone => authMode == AuthMode.PHONE_OTP || authMode == AuthMode.PHONE_PASSWORD || authMode == AuthMode.PHONE_PASSWORD_OTP;

  static bool get hasEmail => authMode == AuthMode.EMAIL_OTP || authMode == AuthMode.EMAIL_PASSWORD || authMode == AuthMode.EMAIL_PASSWORD_OTP;

  static bool get needsOtpVerification =>
      authMode == AuthMode.EMAIL_OTP || authMode == AuthMode.EMAIL_PASSWORD_OTP || authMode == AuthMode.PHONE_OTP || authMode == AuthMode.PHONE_PASSWORD_OTP;

  ///======================================
  /// Accept Registration In App
  ///======================================
  static bool acceptRegistration = true;

  ///======================================
  /// Having Trouble In App
  ///======================================
  static bool havingTroubleAccount = false;

  ///======================================
  /// Forgot Password In App
  ///======================================
  static bool allowForgotPassword = true;

  /// Forgot Email In App
  static bool allowForgotEmailPassword = false;

  ///======================================
  /// Debug Mode
  ///======================================
  static bool inDebug = true;

  ///======================================
  /// API base url
  ///======================================
  static String apiBaseUrl = "http://kaam-milega.supereasyapi.cfd/api";

  ///======================================
  /// App Name
  ///======================================
  static String appName = "Vishraam Point";

  ///======================================
  /// Home/Dashboard URL [To be used to redirect user after login]
  ///======================================
  static String homeUrl = HomeRoutes.home;

  ///======================================
  /// Font Family For The Headings And Titles
  ///======================================
  static String? headingFontFamily = GoogleFonts.openSans().fontFamily;

  ///======================================
  /// Font Family For The Body Text
  ///======================================
  static String? bodyFontFamily = GoogleFonts.openSans().fontFamily;

  ///======================================
  /// Terms and Condition base url
  ///======================================
  static String termsConditionUrl = "https://defenzelite.com";

  ///======================================
  /// Privacy Policy base url
  ///======================================
  static String privacyPolicyUrl = "https://defenzelite.com";

  ///======================================
  /// Date Format
  /// 1 : "MMMM do yyyy, h:mm:ss a", 2 : "MMM do yy", 3 : "dd, MMM yyyy" , 4 : "yyyy-MM-dd",
  ///======================================
  static int dateFormatted = 3;

  ///======================================
  /// Time Format
  ///
  ///======================================
  static int timeFormatted = 1;

  /// Google Translate API Key
  static String googleTranslateApiKey = "";
// static String googleTranslateApiKey = "AIzaSyALNo6MsYHi9pYq-WZ681HPDnibXnVq1lI";
}
