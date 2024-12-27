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
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../helpers/Global.dart';
import '../../../models/ApiResponse.dart';
import '../models/HomeModel.dart';
import '../models/HomeSliderModel.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';
import '../../Hotel/route/HotelRoutes.dart';
import '../services/HomeService.dart';

class HourlyController extends AppController {
  /// Create and get the instance of the controller
  static HourlyController get instance {
    if (!Get.isRegistered<HourlyController>()) Get.put(HourlyController());
    return Get.find<HourlyController>();
  }

  /// Initialise [HomeModule] service
  final HomeService _homeService = HomeService.instance;

  /// Initialize For Global Usage (Once per app run)
  late GoogleMapController googleMapController;

  /// --- System Handlers ---
  /// Observables & Getters

  var _hideScroller = true.obs;

  bool get hideScroller => _hideScroller.value;
  var _selectRadio = false.obs;

  bool get selectRadio => _selectRadio.value;
  var _selectPreference = 0.obs;

  int get selectPreference => _selectPreference.value;
  var _days = 1.obs;

  int get days => _days.value;
  var _selectedFromDate = DateTime.now().obs;

  DateTime get selectedFromDate => _selectedFromDate.value;
  var _selectedToDate = DateTime.now().add(Duration(days: 1)).obs;

  DateTime get selectedToDate => _selectedToDate.value;
  var _selectAge = 0.obs;

  int get selectAge => _selectAge.value;
  var _countRoom = 0.obs;

  int get countRoom => _countRoom.value;
  var _count = [].obs;

  List get count => _count.value;
  var _countAdult = 0.obs;

  int get countAdult => _countAdult.value;
  var _countChildren = 0.obs;

  int get countChildren => _countChildren.value;

  var _searchButtonLoading = false.obs;

  bool get searchButtonLoading => _searchButtonLoading.value;
  var _answers = false.obs;

  bool get answers => _answers.value;

  /// --- Functionality Handlers ---
  /// Observables & Getters
  var _homeData = HomeModel().obs;

  HomeModel get homeData => _homeData.value;
  var _sliderOne = <HomeSliderModel>[].obs;

  List<HomeSliderModel> get sliderOne => _sliderOne;

  @override
  void onInit() {
    super.onInit();
    getHomeSlider();
    index();
  }

  /// --- Core Functionalities Methods ---
  // Index

  Future<void> index() async {
    try {
      setBusy(true);
      _homeService.init();
      ApiResponse response = await _homeService.index();

      if (response.hasError()) {
        setBusy(false);
        return;
      }
      if (response.hasData()) {
        _homeData(HomeModel.fromJson(response.data));
      }
      setBusy(false);
      _homeService.close();
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "${e.toString()}"));
    }
  }

  Future<void> getHomeSlider() async {
    try {
      setBusy(true);
      _homeService.init();
      ApiResponse response = await _homeService.getHomeSlider();

      if (response.hasError()) {
        setBusy(false);
        return;
      }
      if (response.hasData()) {
        _sliderOne.assignAll(List<HomeSliderModel>.from(response.data['slider'].map((x) => HomeSliderModel.fromJson(x))));
      }
      setBusy(false);
      _homeService.close();
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "${e.toString()}"));
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

  void onSelectToDate(DateTime? end) {
    _selectedToDate(end);
  }

  void onSearchLoadingButton() {
    _searchButtonLoading(true);
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(HotelRoutes.hotel);
      _searchButtonLoading(false);
    });
  }

  void onSelectPreference(int value) {
    _selectRadio(!_selectRadio.value);
    if (_selectRadio.value == false) {
      _selectPreference(0);
    } else if (_selectRadio.value == true) {
      _selectPreference(value);
    }
  }

  void onCountRoom({bool add = false}) {
    if (add) _countRoom++;
    if (!add && countRoom > 0) _countRoom--;
  }

  void onCountAdult({bool add = false}) {
    if (add) _countAdult++;
    if (!add && countAdult > 0) _countAdult--;
  }

  void onCountChildren({bool add = false}) {
    if (add) _countChildren++;
    if (!add && countChildren > 0) _countChildren--;
    if (add) {
      _count.add(_countChildren.value);
    }
    if (!add) {
      _count.removeAt(_countChildren.value);
    }

    log.w(_count.value);
  }

  void onSelectAge(int value) {
    _selectAge(value);
  }

  void onTabAnswers() {
    _answers(!_answers.value);
  }

  void onMapCreated(GoogleMapController controller) async {
    googleMapController = controller;
  }

  /// --- Form Functionalities Methods ---
}
