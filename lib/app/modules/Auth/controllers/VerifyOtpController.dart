/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_countr/Countr.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/Toastr.dart';
import '../../../helpers/Global.dart';
import '../../../models/ApiResponse.dart';
import '../../../shared/controllers/AppController.dart';
import '../../Modules.dart';
import '../services/services/AuthService.dart';


class VerifyOtpController extends AppController {
  /// Creating Global Instance
  static VerifyOtpController get instance {
    if (!Get.isRegistered<VerifyOtpController>())
      Get.put(VerifyOtpController());
    return Get.find<VerifyOtpController>();
  }

  /// Initialise [VerifyOtpModule] service
  CountrController? countrController;
  final AuthService _authService = AuthService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters
  var _otp = "".obs;
  var _start = '20'.obs;

  String get otp => _otp.value;
  var _timeUp = true.obs;

  String get start => _start.value;
  var _phoneNumber = "".obs;

  bool get timeUp => _timeUp.value;

  /// --- Functionality Handlers ---
  /// Observables & Observables
  ///
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpInput = TextEditingController();

  @override
  onInit() async {
    super.onInit();
    countrController = CountrController(
        endTime: int.parse(_start.value).seconds, initialize: true);
    _phoneNumber(Get.parameters['identifier']);
  }

  /// --- Supporting Functionalities Methods ---
  void resentTime() {
    countrController!.startTimer();
  }

  void setTimeUp() {
    _timeUp.value = false;
  }

  void setStartTimeUp() {
    _timeUp.value = true;
  }

  /// --- Core Functionalities Methods ---

  // Store
  Future<void> store({bool refresh = false}) async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    // try {
    /// Prepare form data to be sent to server
    Map<String, dynamic> body = {
      "phone": _phoneNumber.value,
      "otp": otpInput.text,
    };

    /// Call api to login user
    ApiResponse response = await _authService.verifyOtp(body: body);

    if (response.hasValidationErrors()) {
      Toastr.show(message: "${response.validationError}");
      return;
    }
    if (response.hasError()) {
      Toastr.show(message: "${response.message}");
      return;
    }

    await auth.setUserData(response.data['user']);
    await auth.setUserToken(response.data['token']);
    Toastr.show(message: "${response.message}");
    Get.toNamed(HomeRoutes.home);
  }

/// --- Common Functionalities Methods ---

/// For Showing Share Dialogue

/// --- Form Functionalities Methods ---
}
