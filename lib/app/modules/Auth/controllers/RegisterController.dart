/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../models/ApiResponse.dart';
import '../../../shared/shared.dart';
import '../../Modules.dart';
import '../services/services/AuthService.dart';

class RegisterController extends AppController {
  /// Creating Global Instance
  static RegisterController get instance {
    if (!Get.isRegistered<RegisterController>()) Get.put(RegisterController());
    return Get.find<RegisterController>();
  }

  final LoginController loginController = LoginController.instance;
  final AuthService _authService = AuthService.instance;

  /// Initialize For Global Usage (Once per app run)

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /// --- System Handlers ---
  /// Observables & Getters


  var _selectedState = 0.obs;
  int get selectedState => _selectedState.value;
  var _selectedDob = DateTime.now().obs;
  DateTime get selectedDob => _selectedDob.value;
  var _selectedGender = "0".obs;
  String get selectedGender => _selectedGender.value;

  /// --- Functionality Handlers ---
  /// Observables & Getters

  final TextEditingController firstNameInput = TextEditingController();
  final TextEditingController lastNameInput = TextEditingController();
  final TextEditingController usernameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController phoneInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    // setData();
    submit();
  }


  /// --- Core Functionalities Methods ---
  // Index
  Future<void> index({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  //Show
  Future<void> show({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  // Create
  Future<void> create({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  // Store
  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      Map<String, dynamic> body = {
        "first_name": firstNameInput.text.trim().toString(),
        "last_name": lastNameInput.text.trim().toString(),
        "username": usernameInput.text.trim().toString(),
        "email": emailInput.text.trim().toString(),
        "phone": phoneInput.text.trim().toString(),
        "password": passwordInput.text.trim().toString(),
        "gender": _selectedGender.value,
        "dob": "${_selectedDob.value.year}/${_selectedDob.value.month}/${_selectedDob.value.day}",
      };

      ApiResponse response = await _authService.register(body: body);

      if (response.hasValidationErrors()) {
        Toastr.show(message: "${response.validationError}");
        return;
      }

      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }
      Get.offAllNamed(AuthRoutes.login);
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

  /// --- Supporting Functionalities Methods ---
  void onStateSelect(int state) {
    _selectedState(state);
  }

  void onGenderSelect(String value) {
    _selectedGender(value);
  }

  void onDobSelect(DateTime? newDate) {
    _selectedDob(newDate);
  }

/// --- Form Functionalities Methods ---




}
