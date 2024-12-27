/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/Toastr.dart';

import '../../../helpers/Global.dart';
import '../../../shared/controllers/AppController.dart';
import '../services/ProfileService.dart';

class ProfileController extends AppController {
  /// Creating Global Instance
  static ProfileController get instance {
    if (!Get.isRegistered<ProfileController>()) Get.put(ProfileController());
    return Get.find<ProfileController>();
  }

  /// Initialise [ProfileModule] service
  final ProfileService _profileService = ProfileService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters
  var _dob = DateTime.now().obs;
  DateTime get dob => _dob.value;
  var _selectedGender = "0".obs;
  String get selectedGender => _selectedGender.value;



  /// --- Functionality Handlers ---
  /// Observables & Getters
  var _image = File('').obs;
  File get image => _image.value;
  final _picker = ImagePicker();

  final TextEditingController firstNameInput = TextEditingController();
  final TextEditingController lastNameInput = TextEditingController();
  final TextEditingController phoneInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();


  // Add Scoped Var Here...

  @override
  void onInit() {
    super.onInit();
    /// Do something here
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
      // if (!formKey.currentState!.validate()) {
      //   return;
      // }
      _profileService.init();
      Map<String, dynamic> body = {
        "name": firstNameInput.text,
        "phone": lastNameInput.text,
        "phone": phoneInput.text,
        "email": emailInput.text,
        "selectedDob" : _dob.value,
        "selectedGender" : _selectedGender
      };

      log.w(body);

      // ApiResponse response = await _orderService.createService(body: body);
      //
      // if (response.hasValidationErrors()) {
      //   Toastr.show(message: "${response.validationError}");
      //   return;
      // }
      //
      // if (response.hasError()) {
      //   Toastr.show(message: "${response.message}");
      //   return;
      // }
      // await auth.getUser();
      // _servicename.close();
      // Get.back();
      Get.back();
      Toastr.show(message: "Update Profile Successfully..");
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
  void selectedDate(DateTime value) {
    _dob(value);
  }

  void onSelectGender(String value) {
    _selectedGender(value);
  }

  Future<void> getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      jsonEncode(_image(File(pickedFile.path)));
    } else {
      print('No image selected.');
    }
  }
  /// --- Form Functionalities Methods ---



}

