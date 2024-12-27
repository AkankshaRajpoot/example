/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/modules/Hotel/controllers/HotelShowController.dart';

import '../../../shared/controllers/AppController.dart';
import '../services/HotelService.dart';

class SelectRoomController extends AppController {
  /// Creating Global Instance
  static SelectRoomController get instance {
    if (!Get.isRegistered<SelectRoomController>()) Get.put(SelectRoomController());
    return Get.find<SelectRoomController>();
  }

  /// Initialise [HotelModule] service
  final HotelService _hotelService = HotelService.instance;
  final HotelShowController hotelShowController= Get.put(HotelShowController());

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  var _hideEditButton = false.obs;
  bool get hideEditButton => _hideEditButton.value;
  var _hideMealButton = false.obs;
  bool get hideMealButton => _hideMealButton.value;
  var _hideFacilities = false.obs;
  bool get hideFacilities => _hideFacilities.value;


  /// --- Functionality Handlers ---
  /// Observables & Getters
  var _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;
  var _selectRoom = 0.obs;
  int get selectRoom => _selectRoom.value;
  var _selectOfferRadio = 0.obs;
  int get selectOfferRadio => _selectOfferRadio.value;
  var _isChecked = false.obs;
  bool get isChecked => _isChecked.value;


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

  /// --- Supporting Functionalities Methods ---


  /// --- Common Functionalities Methods ---

  set isCheck(bool value) {
    _isChecked(!_isChecked.value);
  }


  void onSelectHideButton() {
    _hideEditButton(!_hideEditButton.value);
  }
  void onSelectMeal() {
    _hideMealButton(!_hideMealButton.value);
  }

  void onChangedTab(int value) {
    _tabIndex(value);
  }
  void onSelectRoom(int value) {
    _selectRoom(value);
  }

  void onSelectFacility() {
    _hideFacilities(!_hideFacilities.value);
  }
  /// --- Form Functionalities Methods ---

  void viewPlanDialogWidget() {
    Get.bottomSheet(
      Stack(
        alignment: Alignment.topLeft,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: kcWhite,
              borderRadius: BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Room only | Free Cancellation",
                            style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Super Deluxe room",
                            style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => Get.back(),
                        child: Image.asset(
                          "assets/icons/close.png",
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.policy,
                      color: kcDarkAlt,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cancellation Policies",
                          style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Free Cancellation",
                          style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: kcPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Book Today",
                              style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Pay Now",
                              style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "until 29 Mar 23",
                              style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Cancel for free before 11.59 AM",
                              style: TextStyl.bodySm?.copyWith(color: kcPrimary, fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "30 Mar 23",
                              style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Check-in",
                              style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Text(
                  "Free Cancellation on this booking if cancelled before till 29 Mar 23 11.59",
                  style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            left: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                 color: kcButton,
              ),
              child: Text("plan Details & Policies" ,
                style: TextStyl.bodySm?.copyWith(color: kcWhite, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ]
      ),
    );
  }
}
