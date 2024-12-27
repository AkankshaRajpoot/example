/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ui_x/helpers/Toastr.dart';
import '../../../../config/Config.dart';
import '../../../helpers/Global.dart';
import '../../../models/ApiResponse.dart';
import '../../../shared/shared.dart';
import '../../Modules.dart';
import '../services/services/AuthService.dart';

class LoginController extends AppController {
  /// Creating Global Instance
  static LoginController get instance {
    if (!Get.isRegistered<LoginController>()) Get.put(LoginController());
    return Get.find<LoginController>();
  }

  /// Initialise [LoginModule] service
  final AuthService _authService = AuthService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters
  var _code = "+91".obs;

  /// --- Functionality Handlers ---
  /// Observables & Observables
  ///
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  String get code => _code.value;



  @override
  void onInit() async {
    // identifierInput.text = 'anjalichourasiya20000@gmail.com';
    // passwordInput.text = '123456';
    super.onInit();
    if (await storage.read('identifier') != null) {
      phoneInput.text = await storage.read(
        'identifier',
      );
    }
    if (await storage.read('password') != null) {
      passwordInput.text = await storage.read(
        'password',
      );
    }
  }

  /// --- Supporting Functionalities Methods ---
  // Country Code----------------
  void onSelectCountryCode(String value) {
    _code(value);
  }

  /// --- Core Functionalities Methods ---

  // Store
  Future<void> store({bool refresh = false}) async {
    // if (!formKey.currentState!.validate()) return;
    //
    try {
      await storage.write('identifier', phoneInput.text);
      //await storage.write('password', passwordInput.text);

      /// Prepare form data to be sent to server.
      Map<String, dynamic> body = {
        "identifier": phoneInput.text,
        //  "password": passwordInput.text,
      };

      /// Init API Request Server.
      _authService.init();

      /// Call api to login user.
      ApiResponse response = await _authService.login(body: body);

      /// Check for any errors.
      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }

      /// No need to verify OTP
      if (!Config.needsOtpVerification) {
        /// Assign the user data to user object and store locally.
        await auth.setUserData(response.data['user']);
        await auth.setUserToken(response.data['token']);
        Toastr.show(message: "${response.message}");
        Get.offAllNamed(AuthRoutes.verifyOtp);
      } else {
        /// Need to verify OTP
        ///
        /// Redirect to Verify OTP Page with identifier
        Get.toNamed(AuthRoutes.verifyOtp,
            parameters: {"identifier": phoneInput.text});
        Toastr.show(message: "${response.message}");
      }

      /// Close API Request Server
      _authService.close();
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "${e.toString()}"));
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

/// For Showing Share Dialogue

/// --- Form Functionalities Methods ---
}
