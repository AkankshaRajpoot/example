/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'package:get/get.dart';
import 'package:ui_x/helpers/Toastr.dart';
import 'package:vishrampoint/app/modules/Home/HomeModule.dart';
import 'package:vishrampoint/app/modules/Hotel/HotelModule.dart';

import '../../../helpers/Global.dart';
import '../../../models/ApiResponse.dart';
import '../models/HotelModel.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';
import '../services/HotelService.dart';

class HotelController extends AppController {
  /// Creating Global Instance
  static HotelController get instance {
    if (!Get.isRegistered<HotelController>()) Get.put(HotelController());
    return Get.find<HotelController>();
  }

  /// Initialise [HotelModule] service
  final HotelService _hotelService = HotelService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  var _searchTab = false.obs;
  bool get searchTab => _searchTab.value;
  var _hideEditButton = false.obs;
  bool get hideEditButton => _hideEditButton.value;


  /// --- Functionality Handlers ---
  /// Observables & Getters
  var _hotel = <HotelModel>[].obs;
  List<HotelModel> get hotel => _hotel;
  var _checkInDate = DateTime.now().obs;
  DateTime get checkInDate => _checkInDate.value;
  var _checkOutDate = DateTime.now().add(Duration(days:1)).obs;
  DateTime get checkOutDate => _checkOutDate.value;


  @override
  void onInit() {
    super.onInit();
    index();
  }
  /// --- Core Functionalities Methods ---
  // Index
  Future<void> index() async {
    try {
      setBusy(true);
      _hotelService.init();
      ApiResponse response = await _hotelService.index();
      log.w(response.data);
      if (response.hasError()) {
        setBusy(false);
        return;
      }
      if (response.hasData()) {
        _hotel.assignAll(List<HotelModel>.from(
            response.data.map((x) => HotelModel.fromJson(x))));
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
      Get.toNamed(HomeRoutes.home);
      Toastr.show(message: "Update Successfully..");
    } on Exception catch (e) {
      print(e);
    }
  }



  /// --- Common Functionalities Methods ---

  /// --- Supporting Functionalities Methods ---
  void onSelectHideButton() {
    _hideEditButton(!_hideEditButton.value);
  }

  void onSearchTab() {
    _searchTab(!_searchTab.value);
  }

  void onChangeCheckInDate(DateTime date) {
    _checkInDate(date);
  }


  void onChangeCheckOutDate(DateTime date) {
    _checkOutDate(date);
  }
  /// --- Form Functionalities Methods ---




}
