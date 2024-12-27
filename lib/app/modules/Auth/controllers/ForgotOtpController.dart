/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/


import 'package:flutter/material.dart';
import 'package:flutter_countr/Countr.dart';
import 'package:get/get.dart';
import '../../../helpers/Global.dart';
import '../../../shared/controllers/AppController.dart';
import '../services/services/AuthService.dart';



class ForgotOtpController extends AppController {
  /// Creating Global Instance
  static ForgotOtpController get instance {
    if (!Get.isRegistered<ForgotOtpController>())
      Get.put(ForgotOtpController());
    return Get.find<ForgotOtpController>();
  }


  /// Initialise [ForgotOtpModule] service
  CountrController? countrController;
  final AuthService _authService = AuthService.instance;


  /// Initialize For Global Usage (Once per app run)



  /// --- System Handlers ---
  /// Observables & Getters
  var _otp = "".obs;
  String get otp => _otp.value;
  var _start = '20'.obs;
  String get start => _start.value;
  var _timeUp = true.obs;
  bool get timeUp => _timeUp.value;


  /// --- Functionality Handlers ---
  /// Observables & Observables
  ///
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController();



  @override
  onInit() async {
    super.onInit();
    countrController = CountrController(
        endTime: int.parse(_start.value).seconds, initialize: true);
    if (await storage.read('phone') != null) {
      phoneNumber.text = await storage.read('phone');
    }
  }




  /// --- Core Functionalities Methods ---
  // Store
  Future<void> store({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  //Edit
  Future<void> edit({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  // Update
  Future<void> patch({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  //Delete
  Future<void> delete({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }



  /// --- Common Functionalities Methods ---

  /// --- Supporting Functionalities Methods ---


/// --- Form Functionalities Methods ---
  void resentTime() {
    countrController!.startTimer();
  }

  void setTimeUp() {
    _timeUp.value = false;
  }

  void setStartTimeUp() {
    _timeUp.value = true;
  }

}
