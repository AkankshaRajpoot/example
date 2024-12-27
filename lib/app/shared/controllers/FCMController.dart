import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../helpers/Global.dart';

class FCMController extends GetxController {
  static final FCMController instance = Get.find<FCMController>();
  var _token = ''.obs;
  var fcmNotificationData = RemoteMessage().obs;

  String get deviceToken => _token.value;

  @override
  void onInit() {
    super.onInit();

    AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');
    InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) => _handleNotificationClick(payload.toString()));

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      /// Update reactive variable data
      fcmNotificationData(message);

      var data = message.data;
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          message.notification.hashCode,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });

    getToken();
  }

  void _handleNotificationClick(String? payload) async {
    var data = jsonDecode(payload!);

    /// Handle if the notification related to message
    if (data['type'] == 'message') {
      ///Condition
    }

    /// Handle if the notification related to other stuffs | Notifications
    if (data['type'] == 'notification') {
      /// Handle if the actionable is Post Type
      if (data['actionable'] == 'Post') {
        ///Condition
      }

      /// Handle if the actionable is Profile Type
      if (data['actionable'] == 'Profile') {
        ///Condition
      }
    }
  }

  getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    _token(token);
    log.w(_token.value);
  }
}
