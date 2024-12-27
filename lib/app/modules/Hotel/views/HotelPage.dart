import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/EditFilterWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/HotelCardWidget.dart';
import 'package:vishrampoint/app/shared/views/layouts/MasterLayout.dart';

import '../models/HotelModel.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../Shimmer/HotelShimmer.dart';
import '../controllers/HotelController.dart';

class HotelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelController>(
      init: HotelController(),
      builder: (HotelController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : ResponsiveUi(
                mobile: MobileHotel(
                  controller: controller,
                ),
                tablet: TabletHotel(
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
class MobileHotel extends StatelessWidget {
  const MobileHotel({super.key, required this.controller});

  final HotelController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MasterLayout(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
            child: Icon(Icons.arrow_back)),
        titleSpacing: 0,
        title: !controller.searchTab
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seoni',
                    style: TextStyl.bodySm?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '30 mar - 31 mar, 2 Adults',
                        style: TextStyl.bodySm?.copyWith(fontSize: 12, color: kcDarkAlt, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => controller.onSelectHideButton(),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          decoration: BoxDecoration(color: kcInfo.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
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
              )
            : TextFormField(
                decoration: InputDecoration(
                  fillColor: kcWhite.withOpacity(0.6),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Search Hotel",
                  // prefixIcon: Icon(Icons.arrow_back),

                  prefixStyle: TextStyle(color: kcDarkAlt),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 30,
                    minHeight: 20,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    minWidth: 30,
                    minHeight: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  hintStyle: TextStyle(color: kcDarkAlt.withOpacity(0.5), fontSize: 15),
                ),
                autofocus: true,
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: GestureDetector(
              onTap: () {
                controller.onSearchTab();
              },
              child: Icon(
                Icons.search,
                size: 22,
                color: kcInfoDark,
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
              SizedBox(height: 8),
              Expanded(
                child: controller.isBusy
                    ? HotelShimmer()
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
                                BoxShadow(
                                  color: kcDarkAlt.withOpacity(0.3),
                                  blurRadius: 2,
                                )
                              ]),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(38),
                                        bottomRight: Radius.circular(38),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[kcPrimary.withOpacity(0.1), kcWhite],
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/icons/offer.png", height: 33),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "SPECIAL",
                                              style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontSize: 16),
                                            ),
                                            Text(
                                              "OFFERS",
                                              style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "25% Instant Savings",
                                          style: TextStyl.bodySm?.copyWith(color: kcInfoDark, fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "on stays Hotel Shivani",
                                          style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: kcInfoDark,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            ...List.generate(controller.hotel.length, (index) {
                              HotelModel hotel = controller.hotel[index];
                              return HotelCardWidget(hotel: hotel);
                            })
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///+++++++++++++++++++++++++
///Tablet
///+++++++++++++++++++++++++
class TabletHotel extends StatelessWidget {
  const TabletHotel({super.key, required this.controller});

  final HotelController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MasterLayout(
        titleSpacing: 0,
        title: !controller.searchTab
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seoni',
                    style: TextStyl.bodySm?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '30 mar - 31 mar, 2 Adults',
                        style: TextStyl.bodySm?.copyWith(fontSize: 12, color: kcDarkAlt, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => controller.onSelectHideButton(),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          decoration: BoxDecoration(color: kcInfo.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
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
              )
            : TextFormField(
                decoration: InputDecoration(
                  fillColor: kcWhite.withOpacity(0.6),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Search Hotel",
                  // prefixIcon: Icon(Icons.arrow_back),

                  prefixStyle: TextStyle(color: kcDarkAlt),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 30,
                    minHeight: 20,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    minWidth: 30,
                    minHeight: 20,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  hintStyle: TextStyle(color: kcDarkAlt.withOpacity(0.5), fontSize: 15),
                ),
                autofocus: true,
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: InkWell(
              onTap: () {
                controller.onSearchTab();
              },
              child: Icon(
                Icons.search,
                size: 22,
                color: kcInfoDark,
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
              SizedBox(height: 8),
              Expanded(
                child: controller.isBusy
                    ? HotelShimmer()
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
                                BoxShadow(
                                  color: kcDarkAlt.withOpacity(0.3),
                                  blurRadius: 2,
                                )
                              ]),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(38),
                                        bottomRight: Radius.circular(38),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[kcPrimary.withOpacity(0.1), kcWhite],
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/icons/offer.png", height: 33),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "SPECIAL",
                                              style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontSize: 16),
                                            ),
                                            Text(
                                              "OFFERS",
                                              style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "25% Instant Savings",
                                          style: TextStyl.bodySm?.copyWith(color: kcInfoDark, fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "on stays Hotel Shivani",
                                          style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: kcInfoDark,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            ...List.generate(controller.hotel.length, (index) {
                              HotelModel hotel = controller.hotel[index];
                              return HotelCardWidget(hotel: hotel);
                            })
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
