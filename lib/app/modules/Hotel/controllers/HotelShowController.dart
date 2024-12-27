/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/


import 'dart:core';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ui_x/helpers/Toastr.dart';
import '../../../helpers/Global.dart';
import '../../../models/ApiResponse.dart';
import '../models/HotelModel.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/controllers/PermisionController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';
import '../route/HotelRoutes.dart';
import '../services/HotelService.dart';



class HotelShowController extends AppController {
  /// Creating Global Instance
  static HotelShowController get instance {
    if (!Get.isRegistered<HotelShowController>()) Get.put(HotelShowController());
    return Get.find<HotelShowController>();
  }

  /// Initialise [HotelModule] service
  final HotelService _hotelService = HotelService.instance;
  late GoogleMapController googleMapController;
  final PermissionController permissionController = Get.put(PermissionController());



  /// Initialize For Global Usage (Once per app run)


  /// --- System Handlers ---
  /// Observables & Getters
  var _hideEditButton = false.obs;
  var _scrollTaps = 0.obs;
   bool get hideEditButton => _hideEditButton.value;
  var _selectOfferRadio = 0.obs;
   int get scrollTaps => _scrollTaps.value;



  /// --- Functionality Handlers ---
  /// Observables & Observables
  ///
  var _hotelShow = HotelShowModel().obs;
  int get selectOfferRadio => _selectOfferRadio.value;
  HotelShowModel get hotelShow => _hotelShow.value;
  var _checkInDate = DateTime.now().obs;
  DateTime get checkInDate => _checkInDate.value;
  var _checkOutDate = DateTime.now().add(Duration(days:1)).obs;
  DateTime get checkOutDate => _checkOutDate.value;


  @override
  void onInit() async {
    super.onInit();
    index();
    await permissionController.requestLocationPermission();
  }


  /// --- Common Functionalities Methods ---

  void onSelectOffer(int value) {
    _selectOfferRadio(value);
  }


  void onSelectHideButton() {
    _hideEditButton(!_hideEditButton.value);
  }

  void onChangeCheckInDate(DateTime date) {
    _checkInDate(date);
  }
  void onChangeCheckOutDate(DateTime date) {
    _checkOutDate(date);
  }
  void onScrollTaps(int value) {
    _scrollTaps(value);
  }
  void share()
  {
    Share.share('Checkout this hotel' + 'https://www.goibibo.com/hotels/');
  }




  /// --- Core Functionalities Methods ---
  // Index
  Future<void> index({bool refresh = false}) async {
    try {
      setBusy(true);
      _hotelService.init();
      ApiResponse response = await _hotelService.getHotelShow();


      if (response.hasError()) {
        setBusy(false);
        return;
      }
      if (response.hasData()) {
        _hotelShow(HotelShowModel.fromJson(response.data));
      }
      setBusy(false);
      _hotelService.close();
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "${e.toString()}"));
    }
  }

  // Store
  Future<void> store({bool refresh = false}) async {
    try {
      // if (!formKey.currentState!.validate()) {
      //   return;
      // }
      _hotelService.init();
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
      Get.toNamed(HotelRoutes.selectRoom);
      Toastr.show(message: "The room has been selected successfully..");
    } on Exception catch (e) {
      print(e);
    }
  }
/// --- Supporting Functionalities Methods ---

/// --- Common Functionalities Methods ---

/// For Showing Share Dialogue

/// --- Form Functionalities Methods
}
