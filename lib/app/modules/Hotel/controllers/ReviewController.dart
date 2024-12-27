/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/


import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vishrampoint/app/modules/Hotel/controllers/HotelShowController.dart';
import '../../../shared/controllers/AppController.dart';
import '../services/HotelService.dart';


class ReviewController extends AppController {
  /// Creating Global Instance
  static ReviewController get instance {
    if (!Get.isRegistered<ReviewController>()) Get.put(ReviewController());
    return Get.find<ReviewController>();
  }

  /// Initialise [ReviewModule] service
  final HotelService _hotelService = HotelService.instance;
  final HotelShowController hotelShowController = Get.put(HotelShowController());

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  var _selectedFromDate = DateTime.now().obs;
  DateTime get selectedFromDate => _selectedFromDate.value;
  var _selectedToDate = DateTime.now().add(Duration(days: 1)).obs;
  DateTime get selectedToDate => _selectedToDate.value;
  var _hideScroller = true.obs;
  bool get hideScroller => _hideScroller.value;
  var _selectOfferRadio = 0.obs;
  int get selectOfferRadio => _selectOfferRadio.value;
  var _selectRadio = 0.obs;
  int get selectRadio => _selectRadio.value;
  var _selectBank = 0.obs;
  int get selectBank => _selectBank.value;
  var _hideAddress = false.obs;
  bool get hideAddress => _hideAddress.value;
  var _selectCredit = false.obs;
  bool get selectCredit => _selectCredit.value;
  var _selectNetbanking = false.obs;
  bool get selectNetbanking => _selectNetbanking.value;
  var _hideEditButton = false.obs;
  bool get hideEditButton => _hideEditButton.value;

  /// --- Functionality Handlers ---
  /// Observables & Getters

  // Add Scoped Var Here...


  @override
  void onInit() {
    super.onInit();
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
  void onSelectFromDate(DateTime? start) {
    _selectedFromDate(start);
  }

  void onSelectHideButton() {
    _hideEditButton(!_hideEditButton.value);
  }

  void onSelectToDate(DateTime? end) {
    _selectedToDate(end);
  }

  void onHideScroller() {
    _hideScroller(!_hideScroller.value);
  }
  void isSelectCredit() {
    _selectCredit(!_selectCredit.value);
  }  void isSelectNetbanking() {
    _selectNetbanking(!_selectNetbanking.value);
  }
  void onAddressHide() {
    _hideAddress(!_hideAddress.value);
  }

  void onSelectOffer(int value) {
    _selectOfferRadio(value);
  }
  void onSelectBank(int value) {
    _selectBank(value);
  }
  void onSelectRadio() {
    _selectRadio(_selectRadio.value);
  }

  void scroller(notification) {
    if (notification.direction == ScrollDirection.forward) {
      _hideScroller.value = true;
    } else if (notification.direction == ScrollDirection.reverse) {
      _hideScroller.value = false;
    }
  }
  /// --- Form Functionalities Methods ---


}
