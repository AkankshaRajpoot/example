import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/widgets/buttons/Button.dart';
import 'package:vishrampoint/app/modules/Hotel/models/HotelModel.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/AmenitiesWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/EditFilterWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/LocationWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/OverViewWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/PoliciesWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/QnAWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/ReviewWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/ScrollWidget.dart';
import 'package:vishrampoint/app/shared/views/layouts/MasterLayout.dart';
import '../../../helpers/Global.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../Shimmer/HotelShowShimmer.dart';
import '../controllers/HotelShowController.dart';

class HotelShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelShowController>(
      init: HotelShowController(),
      builder: (HotelShowController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : ResponsiveUi(
                mobile: MobileHotelShow(
                  controller: controller,
                ),
                tablet: TabletHotelShow(
                  controller: controller,
                ),
              );
      },
    );
  }
}

///+++++++++++++++++++++++++
///Mobile
///+++++++++++++++++++++++++
class MobileHotelShow extends StatelessWidget {
  const MobileHotelShow({super.key, required this.controller});

  final HotelShowController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      titleSpacing: 0,
      backgroundColor: kcBackground,
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
      actions: [
        GestureDetector(
          onTap: () {
            controller.share();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Icon(
              Icons.share,
              size: 22,
            ),
          ),
        )
      ],
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Visibility(
                visible: controller.hideEditButton,
                child: EditFilterWidget(
                    onTap: () {},
                    checkInDate: "30 Mar '23",
                    checkOutDate: "30 Mar '23",
                    rooms: "1 Room",
                    guests: "2 Adults 0 Children",
                    city: "Seoni",
                    landmark: true,
                    title: false,
                    controller: controller),
              ),
            ),
            Expanded(
              child: controller.isBusy
                  ? HotelShowShimmer()
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                    controller.hotelShow.hotelImage!.length,
                                    (index) {
                                  HotelImage image =
                                      controller.hotelShow.hotelImage![index];
                                  return Container(
                                    color: kcDarkAlt.withOpacity(0.1),
                                    height: 200,
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    child:
                                        // Image.network(
                                        //   '${image.image}',
                                        //   fit: BoxFit.contain,
                                        // ),

                                        Image.asset(
                                      'assets/placeholders/hotel-placeholder.png',
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),

                          Obx(
                            () => Container(
                              width: screen.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                              decoration: BoxDecoration(color: kcWhite),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(0),
                                      active: controller.scrollTaps == 0,
                                      header: 'Overview',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(1),
                                      active: controller.scrollTaps == 1,
                                      header: 'Amenities',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(2),
                                      active: controller.scrollTaps == 2,
                                      header: 'Policies',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(3),
                                      active: controller.scrollTaps == 3,
                                      header: 'Reviews',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(4),
                                      active: controller.scrollTaps == 4,
                                      header: 'QnA',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(5),
                                      active: controller.scrollTaps == 5,
                                      header: 'Location',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Obx(() => controller.scrollTaps == 0
                              ? OverViewWidget(
                                  controller: controller,
                                )
                              : controller.scrollTaps == 1
                                  ? AmenitiesWidget()
                                  : controller.scrollTaps == 2
                                      ? PoliciesWidget(
                                          title: 'About Property',
                                          policy: 4,
                                        )
                                      : controller.scrollTaps == 3
                                          ? ReviewWidget()
                                          : controller.scrollTaps == 4
                                              ? QnAWidget()
                                              : LocationWidget()),
                          SizedBox(
                            height: 10,
                          ),

                          //AmenitiesWidget()
                        ],
                      ),
                    ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: kcInfoLight.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Text(
                    "1 Room - ",
                    style: TextStyl.bodySm?.copyWith(
                        color: kcDarkGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Fits ",
                    style: TextStyl.bodySm?.copyWith(
                      color: kcDarkGreen,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "2 Adults ",
                    style: TextStyl.bodySm?.copyWith(
                        color: kcDarkGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
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
                    Column(
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
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Button.block(
                        key: UniqueKey(),
                        label: "SELECT ROOM",
                        onTap: (set) async {
                          set.setBusy(true).setDisabled(true);
                          await controller.store();
                          set.setBusy(false).setDisabled(false);
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

///+++++++++++++++++++++++++
///Tablet
///+++++++++++++++++++++++++
class TabletHotelShow extends StatelessWidget {
  const TabletHotelShow({super.key, required this.controller});

  final HotelShowController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      titleSpacing: 0,
      backgroundColor: kcBackground,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seoni',
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
      actions: [
        InkWell(
          onTap: () {
            controller.share();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Icon(
              Icons.share,
              size: 22,
            ),
          ),
        )
      ],
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Visibility(
                visible: controller.hideEditButton,
                child: EditFilterWidget(
                  controller: controller,
                  onTap: () {},
                  checkInDate: "30 Mar '23",
                  checkOutDate: "30 Mar '23",
                  rooms: "1 Room",
                  guests: "2 Adults 0 Children",
                  city: "Seoni",
                  title: true,
                ),
              ),
            ),
            Expanded(
              child: controller.isBusy
                  ? HotelShowShimmer()
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                    controller.hotelShow.hotelImage!.length,
                                    (index) {
                                  HotelImage image =
                                      controller.hotelShow.hotelImage![index];
                                  return Container(
                                    color: kcDarkAlt.withOpacity(0.1),
                                    height: 200,
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    child:
                                        // Image.network(
                                        //   '${image.image}',
                                        //   fit: BoxFit.contain,
                                        // ),

                                        Image.asset(
                                      'assets/placeholders/hotel-placeholder.png',
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),

                          Obx(
                            () => Container(
                              width: screen.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                              decoration: BoxDecoration(color: kcWhite),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(0),
                                      active: controller.scrollTaps == 0,
                                      header: 'Overview',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(1),
                                      active: controller.scrollTaps == 1,
                                      header: 'Amenities',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(2),
                                      active: controller.scrollTaps == 2,
                                      header: 'Policies',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(3),
                                      active: controller.scrollTaps == 3,
                                      header: 'Reviews',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(4),
                                      active: controller.scrollTaps == 4,
                                      header: 'QnA',
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ScrollWidget(
                                      onTap: () => controller.onScrollTaps(5),
                                      active: controller.scrollTaps == 5,
                                      header: 'Location',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Obx(() => controller.scrollTaps == 0
                              ? OverViewWidget(
                                  controller: controller,
                                )
                              : controller.scrollTaps == 1
                                  ? AmenitiesWidget()
                                  : controller.scrollTaps == 2
                                      ? PoliciesWidget(
                                          title: 'About Property',
                                          policy: 4,
                                        )
                                      : controller.scrollTaps == 3
                                          ? ReviewWidget()
                                          : controller.scrollTaps == 4
                                              ? QnAWidget()
                                              : LocationWidget()),
                          SizedBox(
                            height: 10,
                          ),

                          //AmenitiesWidget()
                        ],
                      ),
                    ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: kcInfoLight.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Text(
                    "1 Room - ",
                    style: TextStyl.bodySm?.copyWith(
                        color: kcDarkGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Fits ",
                    style: TextStyl.bodySm?.copyWith(
                      color: kcDarkGreen,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "2 Adults ",
                    style: TextStyl.bodySm?.copyWith(
                        color: kcDarkGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
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
                    Column(
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
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Button.block(
                        key: UniqueKey(),
                        label: "SELECT ROOM",
                        onTap: (set) async {
                          set.setBusy(true).setDisabled(true);
                          await controller.store();
                          set.setBusy(false).setDisabled(false);
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
