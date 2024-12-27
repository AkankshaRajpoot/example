import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
// import 'package:workmanager/workmanager.dart';

import 'app/modules/Modules.dart';
import 'app/shared/controllers/AuthState.dart';

// import 'app/shared/controllers/BackgroundUploadController.dart';
import 'app/shared/controllers/FCMController.dart';
import 'app/shared/controllers/FCMCrashlyticsController.dart';
import 'app/shared/views/widgets/ThemeBuilder.dart';
import 'config/Config.dart';
import 'config/theme/AppTheme.dart';
import 'firebase_options.dart';
import 'routes/Router.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   flutterLocalNotificationsPlugin.show(
//     message.notification.hashCode,
//     message.notification!.title,
//     message.notification!.body,
//     NotificationDetails(
//       android: AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channelDescription: channel.description,
//       ),
//     ),
//     payload: jsonEncode(message.data),
//   );
// }

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//final BackgroundUploadController backgroundUploadController = Get.put(BackgroundUploadController());

void main() async {
  //runZonedGuarded<Future<void>>(() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  // ///Work Manager Initialize
  // await Workmanager.initialize(callbackDispatcher, // The top level function, aka callbackDispatcher
  //     isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  //     );
  // await Workmanager.registerPeriodicTask("5", fetchBackground,
  //     existingWorkPolicy: ExistingWorkPolicy.replace,
  //     frequency: Duration(minutes: 15), //when should it check the link
  //     initialDelay: Duration(seconds: 10), //duration before showing the notification
  //     constraints: Constraints(
  //       networkType: NetworkType.connected,
  //     ));

  /// Firebase Initialize
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  /// Initialize the storage
  await GetStorage.init();

  /// Initialize the Firebase Cloud Messaging controller
 // Get.put(FCMController(), permanent: true);

  /// Initialize the Firebase Crashlytics controller
 // Get.put(FCMCrashlyticsController(), permanent: true);

  Get.put(SettingController(), permanent: true);

  /// Initialize [AuthState]
  Get.lazyPut<AuthState>(() => AuthState(), fenix: true);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
  // },
  //     (error, stack) => FirebaseCrashlytics.instance.recordError(
  //           error,
  //           stack,
  //         ));
}

const fetchBackground = "fetchBackground";

// void callbackDispatcher() {
//   Workmanager.executeTask((task, inputData) async {
//     switch (task) {
//       case fetchBackground:
//         // Code to run in background
//         break;
//     }
//     return Future.value(true);
//   });
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : kcWhite,
        statusBarBrightness: Brightness.light,
      ),
    );
    final SettingController settingController = Get.find<SettingController>();

    return ThemeBuilder(
      builder: (context, _themeMode) {
        return Obx(
          () => GoogleTranslatorInit(
            Config.googleTranslateApiKey,
            translateFrom: Locale('en'),
            translateTo: Locale(settingController.setting.appLocale ?? 'en'),
            builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.fadeIn,
              title: "${Config.appName}",
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
              //_themeMode
              initialRoute: SplashRoutes.splash,
              getPages: routes,
            ),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
