import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/AddMealWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/EditFilterWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/FilterOptionWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/OffersWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/RoomSelectWidget.dart';
import 'package:vishrampoint/app/modules/Modules.dart';
import 'package:vishrampoint/app/shared/views/layouts/MasterLayout.dart';

import '../../../helpers/Global.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';

class SelectRoomPage extends StatelessWidget {
  const SelectRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SelectRoomController(),
        builder: (SelectRoomController controller) {
          return ResponsiveUi(
            mobile: MobileSelectRoom(
              controller: controller,
            ),
            tablet: TabletSelectRoom(
              controller: controller,
            ),
          );
        });
  }
}

///+++++++++++++++++++++++++
///Mobile
///+++++++++++++++++++++++++
class MobileSelectRoom extends StatelessWidget {
  const MobileSelectRoom({super.key, required this.controller});

  final SelectRoomController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hotel Shivani Inn',
            style: TextStyl.bodySm
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                '30 mar - 31 mar, 2 Adults',
                style: TextStyl.bodySm?.copyWith(
                    fontSize: 12,
                    color: kcDarkAlt,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => controller.onSelectHideButton(),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  decoration: BoxDecoration(
                      color: kcInfo.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edit",
                        style: TextStyle(color: kcInfo, fontSize: 12),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 16,
                        color: kcInfo,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Obx(
          //   () => Visibility(
          //     visible: controller.hideEditButton,
          //     child: EditFilterWidget(
          //       controller: controller.hotelShowController,
          //       onTap: () {},
          //       checkInDate: "30 Mar '23",
          //       checkOutDate: "30 Mar '23",
          //       rooms: "1 Room",
          //       guests: "2 Adults 0 Children",
          //       city: "Seoni",
          //       title: true,
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 8),
            color: kcWhite,
            child: Obx(
              () => Row(
                children: [
                  Text(
                    'Filter by',
                    style: TextStyl.bodySm?.copyWith(
                        fontSize: 12,
                        color: kcBlack.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FilterOptionWidget(
                    onTap: () {
                      controller.onChangedTab(1);
                    },
                    label: "Free Cancellation",
                    active: controller.tabIndex == 1,
                    image: "",
                  ),
                  FilterOptionWidget(
                    onTap: () {
                      // showTopModalSheet(context, Container(
                      //     color: kcWhite,
                      //     height: 250,
                      //     child: Text("mn,mz"))
                      // );
                      controller.onChangedTab(2);
                      controller.onSelectMeal();
                    },
                    label: "Add Meals",
                    active: controller.tabIndex == 2,
                    image: "assets/icons/lunch.png",
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.hideMealButton,
              child: AddMealWidget(
                controller: controller,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        width: screen.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: kcDarkAlt.withOpacity(0.35))
                            ],
                            color: kcWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Super Deluxe Room',
                              style: TextStyl.bodySm?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Container(
                              decoration: BoxDecoration(
                                  color: kcWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: kcDarkAlt.withOpacity(0.35))
                                  ]),
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(5, (index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                              color: kcDarkAlt.withOpacity(0.1),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5),
                                              ),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  'assets/placeholders/hotel-placeholder.png',
                                                  height: 150,
                                                  width: screen.width * 0.9,
                                                  fit: BoxFit.contain,
                                                )),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Room with each and every possible facilities which is required for a person',
                                          style: TextStyl.bodySm?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.house,
                                              color: kcDarkAlt,
                                            ),
                                            Text(
                                              '100 sq.ft',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 43,
                                            ),
                                            Icon(
                                              Icons.bed,
                                              color: kcDarkAlt,
                                            ),
                                            Text(
                                              'Standard Bed',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.people,
                                              color: kcDarkAlt,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'Max 4 Guests',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(
                                              Icons.view_cozy_outlined,
                                              color: kcDarkAlt,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'No View',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              controller.onSelectFacility(),
                                          child: Text(
                                            '+ View More details',
                                            style: TextStyl.bodySm?.copyWith(
                                                color: kcInfo, fontSize: 14),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => Visibility(
                                visible: controller.hideFacilities,
                                child: Column(
                                  children: [
                                    RoomSelectWidget(
                                      onSelectTab: () {
                                        controller.onSelectRoom(0);
                                      },
                                      controller: controller,
                                      roomType: '1. Rooms only',
                                      adult: '2',
                                      price: '2489',
                                      discountPrice: '2225',
                                      taxPrice: '489',
                                      meal: 'No meal included',
                                      active: controller.selectRoom == 0,
                                    ),
                                    RoomSelectWidget(
                                      onSelectTab: () {
                                        controller.onSelectRoom(1);
                                      },
                                      controller: controller,
                                      roomType: '2. Rooms with breakfast ',
                                      adult: '2',
                                      price: '2489',
                                      discountPrice: '2225',
                                      taxPrice: '489',
                                      meal: 'Breakfast included',
                                      active: controller.selectRoom == 1,
                                    ),
                                    RoomSelectWidget(
                                      onSelectTab: () {
                                        controller.onSelectRoom(2);
                                      },
                                      controller: controller,
                                      roomType: '1. Rooms with meal',
                                      adult: '2',
                                      price: '2489',
                                      discountPrice: '2225',
                                      taxPrice: '489',
                                      meal: 'Meal included',
                                      active: controller.selectRoom == 2,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screen.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: kcDarkAlt.withOpacity(0.35))
                            ],
                            color: kcWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Super Deluxe Room with balcony`',
                              style: TextStyl.bodySm?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Container(
                              decoration: BoxDecoration(
                                  color: kcWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: kcDarkAlt.withOpacity(0.35))
                                  ]),
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(5, (index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                              color: kcDarkAlt.withOpacity(0.1),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5),
                                              ),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/placeholders/hotel-placeholder.png",
                                                  height: 150,
                                                  width: screen.width * 0.9,
                                                  fit: BoxFit.contain,
                                                )),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Room with each and every possible facilities which is required for a person',
                                          style: TextStyl.bodySm?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.house,
                                              color: kcDarkAlt,
                                            ),
                                            Text(
                                              '100 sq.ft',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 43,
                                            ),
                                            Icon(
                                              Icons.bed,
                                              color: kcDarkAlt,
                                            ),
                                            Text(
                                              'Standard Bed',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.people,
                                              color: kcDarkAlt,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'Max 4 Guests',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(
                                              Icons.view_cozy_outlined,
                                              color: kcDarkAlt,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'No View',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '+ View More details',
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcInfo, fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RoomSelectWidget(
                              onSelectTab: () {
                                controller.onSelectRoom(0);
                              },
                              controller: controller,
                              roomType: '1. Rooms only',
                              adult: '2',
                              price: '2489',
                              discountPrice: '2225',
                              taxPrice: '489',
                              meal: 'No meal included',
                              active: controller.selectRoom == 0,
                            ),
                            RoomSelectWidget(
                              onSelectTab: () {
                                controller.onSelectRoom(1);
                              },
                              controller: controller,
                              roomType: '2. Rooms with breakfast ',
                              adult: '2',
                              price: '2489',
                              discountPrice: '2225',
                              taxPrice: '489',
                              meal: 'Breakfast included',
                              active: controller.selectRoom == 1,
                            ),
                            RoomSelectWidget(
                              onSelectTab: () {
                                controller.onSelectRoom(2);
                              },
                              controller: controller,
                              roomType: '1. Rooms with meal',
                              adult: '2',
                              price: '2489',
                              discountPrice: '2225',
                              taxPrice: '489',
                              meal: 'Meal included',
                              active: controller.selectRoom == 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: screen.width,
              decoration: BoxDecoration(
                color: kcWhite,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(OffersWidget(
                        controller: controller.hotelShowController,
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '₹2489',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "₹ 2,500",
                              style: TextStyle(
                                color: kcDarkAlt.withOpacity(0.7),
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'per night',
                              style: TextStyl.bodySm
                                  ?.copyWith(color: kcDarkAlt, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              '+₹489 Taxes & Fees',
                              style: TextStyl.bodySm?.copyWith(fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 10,
                              width: 1,
                              color: kcDarkAlt,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '2 offers applied',
                              style: TextStyl.bodySm
                                  ?.copyWith(color: kcInfo, fontSize: 12),
                            ),
                            Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: kcInfo,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(HotelRoutes.review);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: kcButton,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: kcWhite, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

////+++++++++++++++++++++++++
////Tablet
////+++++++++++++++++++++++++
class TabletSelectRoom extends StatelessWidget {
  const TabletSelectRoom({super.key, required this.controller});

  final SelectRoomController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      // automaticallyImplyLeading: false,
      // leading: GestureDetector(
      //     onTap: () {
      //       Get.back();
      //     },
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 8),
      //       child: SvgPicture.asset(
      //         "assets/icons/back.svg",
      //         color: kcBlack.withOpacity(0.8),
      //       ),
      //     )),
      titleSpacing: 0,

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hotel Shivani Inn',
            style: TextStyl.bodySm
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                '30 mar - 31 mar, 2 Adults',
                style: TextStyl.bodySm?.copyWith(
                    fontSize: 12,
                    color: kcDarkAlt,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => controller.onSelectHideButton(),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  decoration: BoxDecoration(
                      color: kcInfo.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edit",
                        style: TextStyle(color: kcInfo, fontSize: 12),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 16,
                        color: kcInfo,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Obx(
          //   () => Visibility(
          //     visible: controller.hideEditButton,
          //     child: EditFilterWidget(
          //       onTap: () {},
          //       checkInDate: "30 Mar '23",
          //       checkOutDate: "30 Mar '23",
          //       rooms: "1 Room",
          //       guests: "2 Adults 0 Children",
          //       city: "Seoni",
          //       title: true, controller: controller,
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 8),
            color: kcWhite,
            child: Obx(
              () => Row(
                children: [
                  Text(
                    'Filter by',
                    style: TextStyl.bodySm?.copyWith(
                        fontSize: 12,
                        color: kcBlack.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FilterOptionWidget(
                    onTap: () {
                      controller.onChangedTab(1);
                    },
                    label: "Free Cancellation",
                    active: controller.tabIndex == 1,
                    image: "",
                  ),
                  FilterOptionWidget(
                    onTap: () {
                      // showTopModalSheet(context, Container(
                      //     color: kcWhite,
                      //     height: 250,
                      //     child: Text("mn,mz"))
                      // );
                      controller.onChangedTab(2);
                      controller.onSelectMeal();
                    },
                    label: "Add Meals",
                    active: controller.tabIndex == 2,
                    image: "assets/icons/lunch.png",
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.hideMealButton,
              child: AddMealWidget(
                controller: controller,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        width: screen.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: kcDarkAlt.withOpacity(0.35))
                            ],
                            color: kcWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Super Deluxe Room',
                              style: TextStyl.bodySm?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Container(
                              decoration: BoxDecoration(
                                  color: kcWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: kcDarkAlt.withOpacity(0.35))
                                  ]),
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(5, (index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5),
                                              ),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/placeholders/hotel-placeholder.png",
                                                  height: 150,
                                                  width: screen.width * 0.9,
                                                  fit: BoxFit.contain,
                                                )),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Room with each and every possible facilities which is required for a person',
                                          style: TextStyl.bodySm?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.house,
                                              color: kcDarkAlt,
                                            ),
                                            Text(
                                              '100 sq.ft',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 43,
                                            ),
                                            Icon(
                                              Icons.bed,
                                              color: kcDarkAlt,
                                            ),
                                            Text(
                                              'Standard Bed',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.people,
                                              color: kcDarkAlt,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'Max 4 Guests',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(
                                              Icons.view_cozy_outlined,
                                              color: kcDarkAlt,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'No View',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              controller.onSelectFacility(),
                                          child: Text(
                                            '+ View More details',
                                            style: TextStyl.bodySm?.copyWith(
                                                color: kcInfo, fontSize: 14),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => Visibility(
                                visible: controller.hideFacilities,
                                child: Column(
                                  children: [
                                    RoomSelectWidget(
                                      onSelectTab: () {
                                        controller.onSelectRoom(0);
                                      },
                                      controller: controller,
                                      roomType: '1. Rooms only',
                                      adult: '2',
                                      price: '2489',
                                      discountPrice: '2225',
                                      taxPrice: '489',
                                      meal: 'No meal included',
                                      active: controller.selectRoom == 0,
                                    ),
                                    RoomSelectWidget(
                                      onSelectTab: () {
                                        controller.onSelectRoom(1);
                                      },
                                      controller: controller,
                                      roomType: '2. Rooms with breakfast ',
                                      adult: '2',
                                      price: '2489',
                                      discountPrice: '2225',
                                      taxPrice: '489',
                                      meal: 'Breakfast included',
                                      active: controller.selectRoom == 1,
                                    ),
                                    RoomSelectWidget(
                                      onSelectTab: () {
                                        controller.onSelectRoom(2);
                                      },
                                      controller: controller,
                                      roomType: '1. Rooms with meal',
                                      adult: '2',
                                      price: '2489',
                                      discountPrice: '2225',
                                      taxPrice: '489',
                                      meal: 'Meal included',
                                      active: controller.selectRoom == 2,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screen.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: kcDarkAlt.withOpacity(0.35))
                            ],
                            color: kcWhite,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Super Deluxe Room with balcony`',
                              style: TextStyl.bodySm?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Container(
                              decoration: BoxDecoration(
                                  color: kcWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: kcDarkAlt.withOpacity(0.35))
                                  ]),
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(5, (index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                              color: kcDarkAlt.withOpacity(0.1),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5),
                                              ),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/placeholders/hotel-placeholder.png",
                                                  height: 150,
                                                  width: screen.width * 0.9,
                                                  fit: BoxFit.contain,
                                                )),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Room with each and every possible facilities which is required for a person',
                                          style: TextStyl.bodySm?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.house,
                                              color: kcDarkAlt,
                                            ),
                                            Text(
                                              '100 sq.ft',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 43,
                                            ),
                                            Icon(
                                              Icons.bed,
                                              color: kcDarkAlt,
                                            ),
                                            Text(
                                              'Standard Bed',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.people,
                                              color: kcDarkAlt,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'Max 4 Guests',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(
                                              Icons.view_cozy_outlined,
                                              color: kcDarkAlt,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'No View',
                                              style: TextStyl.bodySm?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '+ View More details',
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcInfo, fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RoomSelectWidget(
                              onSelectTab: () {
                                controller.onSelectRoom(0);
                              },
                              controller: controller,
                              roomType: '1. Rooms only',
                              adult: '2',
                              price: '2489',
                              discountPrice: '2225',
                              taxPrice: '489',
                              meal: 'No meal included',
                              active: controller.selectRoom == 0,
                            ),
                            RoomSelectWidget(
                              onSelectTab: () {
                                controller.onSelectRoom(1);
                              },
                              controller: controller,
                              roomType: '2. Rooms with breakfast ',
                              adult: '2',
                              price: '2489',
                              discountPrice: '2225',
                              taxPrice: '489',
                              meal: 'Breakfast included',
                              active: controller.selectRoom == 1,
                            ),
                            RoomSelectWidget(
                              onSelectTab: () {
                                controller.onSelectRoom(2);
                              },
                              controller: controller,
                              roomType: '1. Rooms with meal',
                              adult: '2',
                              price: '2489',
                              discountPrice: '2225',
                              taxPrice: '489',
                              meal: 'Meal included',
                              active: controller.selectRoom == 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: screen.width,
              decoration: BoxDecoration(
                color: kcWhite,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(OffersWidget(
                        controller: controller.hotelShowController,
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '₹2489',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "₹ 2,500",
                              style: TextStyle(
                                color: kcDarkAlt.withOpacity(0.7),
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'per night',
                              style: TextStyl.bodySm
                                  ?.copyWith(color: kcDarkAlt, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              '+₹489 Taxes & Fees',
                              style: TextStyl.bodySm?.copyWith(fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 10,
                              width: 1,
                              color: kcDarkAlt,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '2 offers applied',
                              style: TextStyl.bodySm
                                  ?.copyWith(color: kcInfo, fontSize: 12),
                            ),
                            Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: kcInfo,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(HotelRoutes.review);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: kcButton,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: kcWhite, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
