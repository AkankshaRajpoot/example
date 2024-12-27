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
import 'package:ui_x/helpers/Toastr.dart';

import '../../../helpers/Global.dart';
import '../../../shared/controllers/AppController.dart';
import '../route/BookingsRoutes.dart';
import '../services/BookingsService.dart';

class BookingsController extends AppController {
  /// Creating Global Instance
  static BookingsController get instance {
    if (!Get.isRegistered<BookingsController>()) Get.put(BookingsController());
    return Get.find<BookingsController>();
  }

  /// Initialise [BookingsModule] service
  final BookingsService _bookingsService = BookingsService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  var _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  /// --- Functionality Handlers ---
  /// Observables & Getters

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
      // if (!formKey.currentState!.validate()) {
      //   return;
      // }
      _bookingsService.init();
      Map<String, dynamic> body = {

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
      Get.toNamed(BookingsRoutes.bookingDetails);
      Toastr.show(message: "You can view your booking..");
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
      // if (!formKey.currentState!.validate()) {
      //   return;
      // }
      _bookingsService.init();
      Map<String, dynamic> body = {

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
      Toastr.show(message: "The invoice has been downloaded successfully..");
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
  void onChangedTab(int value) {
    _tabIndex(value);
  }

  /// --- Form Functionalities Methods ---


}

