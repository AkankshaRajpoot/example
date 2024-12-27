/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ui_x/ui_x.dart';

class AppController extends GetxController {
  static AppController get instance => Get.put(AppController());
  ScrollController scrollController = new ScrollController(keepScrollOffset: false);

  AudioPlayer? player;

  /// Initialize For Global Usage (Once per app run)
  /// StreamSubscription for ConnectivityResult
  /// ```dart
  /// StreamSubscription<ConnectivityResult>
  /// ```
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  /// --- System Handlers ---
  /// Observables & Getters

  RxBool setSticky = false.obs;
  bool get isSticky => this.setSticky.value;
  bool _isBusy = false;
  bool get isBusy => this._isBusy;
  bool _isConnected = false;
  bool get isConnected => this._isConnected;
  var _toLocale = 'en'.obs;
  String get toLocale => _toLocale.value;

  /// --- Functionality Handlers ---
  /// Observables & Getters

  // Add Scoped Var Here...

  @override
  void onInit() {
    super.onInit();
    player = AudioPlayer();
    this.checkConnection();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _isConnected = false;
      } else {
        _isConnected = true;
        onReconnect();
      }
      update();
    });
    scrollController.addListener(() {
      onScroll();
    });
  }
  /// --- Supporting Functionalities Methods ---

  void onScroll() {
    if (scrollController.positions.last.pixels >= 72) {
      setSticky(true);
    } else {
      setSticky(false);
    }
  }

  /// Executes when user re-connect to any network.
  /// ```
  /// [Cellular Data | WiFi]
  /// ```
  void onReconnect() {
    /// TODO: Implement onReconnect Method
  }

  /// Checks User connection state.
  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      _isConnected = false;
    } else {
      _isConnected = true;
    }
    update();
  }

  /// Set the busy state
  void setBusy(bool val) {
    _isBusy = val;
    update();
  }

  void showBusy() {
    Get.dialog(
      Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: kcWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/icons/loader-circular.gif',
                height: 40,
              ),
              const SizedBox(height: 16),
              Text(
                'Please wait...',
                style: TextStyl.body,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void hideBusy() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void quit() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  void applyLocale(String? locale) {
    _toLocale(locale ?? 'en');
    update();
  }

  @override
  void onClose() {
    if (player != null) player!.dispose();
    scrollController.dispose();
    connectivitySubscription.cancel();
    super.onClose();
  }
}
