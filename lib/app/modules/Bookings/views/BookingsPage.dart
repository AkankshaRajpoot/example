import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';
import 'package:vishrampoint/app/helpers/Global.dart';
import 'package:vishrampoint/app/modules/Bookings/views/widget/CancelledWidget.dart';
import 'package:vishrampoint/app/modules/Bookings/views/widget/CompleteWidget.dart';
import 'package:vishrampoint/app/modules/Bookings/views/widget/TabWidget.dart';
import 'package:vishrampoint/app/modules/Bookings/views/widget/UpcomingWidget.dart';

import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/BottomNavbarWidget.dart';
import '../Shimmer/BookingShimmer.dart';
import '../controllers/BookingsController.dart';

class BookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingsController>(
      init: BookingsController(),
      builder: (BookingsController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : ResponsiveUi(
                mobile: MobileBookings(
                  controller: controller,
                ),
                tablet: TabletBookings(
                  controller: controller,
                ),
              );
      },
    );
  }
}

////+++++++++++++++++++++++++
////Mobile
////+++++++++++++++++++++++++
class MobileBookings extends StatelessWidget {
  const MobileBookings({super.key, required this.controller});

  final BookingsController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcBackground,
      automaticallyImplyLeading: false,
      title: "Bookings",
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: controller.isBusy
                  ? BookingShimmer()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: screen.width,
                            decoration: BoxDecoration(color: kcWhite),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Obx(
                                () => Row(
                                  children: [
                                    TabWidget(
                                      onTap: () {
                                        controller.onChangedTab(0);
                                      },
                                      label: "UPCOMING",
                                      active: controller.tabIndex == 0,
                                    ),
                                    TabWidget(
                                      onTap: () {
                                        controller.onChangedTab(1);
                                      },
                                      label: "COMPLETED",
                                      active: controller.tabIndex == 1,
                                    ),
                                    TabWidget(
                                      onTap: () {
                                        controller.onChangedTab(2);
                                      },
                                      label: "CANCELLED",
                                      active: controller.tabIndex == 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Obx(() => controller.tabIndex == 0
                              ? UpcomingWidget(controller: controller)
                              : controller.tabIndex == 1
                                  ? CompleteWidget()
                                  : CancelledWidget(
                                      controller: controller,
                                    )),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
            ),
            BottomNavbarWidget(
              route: 'bookings',
            ),
          ],
        ),
      ),
    );
  }
}

////+++++++++++++++++++++++++
////Tablet
////+++++++++++++++++++++++++
class TabletBookings extends StatelessWidget {
  const TabletBookings({super.key, required this.controller});

  final BookingsController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcBackground,
      automaticallyImplyLeading: false,
      title: "Bookings",
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: controller.isBusy
                  ? BookingShimmer()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: screen.width,
                            decoration: BoxDecoration(color: kcWhite),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Obx(
                                () => Row(
                                  children: [
                                    TabWidget(
                                      onTap: () {
                                        controller.onChangedTab(0);
                                      },
                                      label: "UPCOMING",
                                      active: controller.tabIndex == 0,
                                    ),
                                    TabWidget(
                                      onTap: () {
                                        controller.onChangedTab(1);
                                      },
                                      label: "COMPLETED",
                                      active: controller.tabIndex == 1,
                                    ),
                                    TabWidget(
                                      onTap: () {
                                        controller.onChangedTab(2);
                                      },
                                      label: "CANCELLED",
                                      active: controller.tabIndex == 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Obx(() => controller.tabIndex == 0
                              ? UpcomingWidget(controller: controller)
                              : controller.tabIndex == 1
                                  ? CompleteWidget()
                                  : CancelledWidget(
                                      controller: controller,
                                    )),
                          SizedBox(
                            height: 5,
                          ),
                          // UpcomingWidget(),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // UpcomingWidget(),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Image.asset(
                          //   'assets/image/bags.png',
                          //   height: 80,
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   "You've No Pending Bookings",
                          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          // ),
                          // Text(
                          //   'Start exploring for your next trip',
                          //   style: TextStyle(fontSize: 12, color: kcDarkAlt),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          //   decoration: BoxDecoration(color: kcWhite),
                          //   child: Row(
                          //     children: [
                          //       Image.asset(
                          //         'assets/image/bags.png',
                          //         height: 37,
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Expanded(
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               'Top 8 Staycation ideas for a',
                          //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          //             ),
                          //             Text(
                          //               'Weekend Getaway',
                          //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          //             ),
                          //             Text(
                          //               'Explore aravali Resort, Chhindwara, Seoni, and many more places',
                          //               style: TextStyle(color: kcDarkAlt, fontSize: 10),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Icon(
                          //         Icons.arrow_forward_ios_rounded,
                          //         color: kcInfo,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          //   decoration: BoxDecoration(color: kcWhite),
                          //   child: Row(
                          //     children: [
                          //       Image.asset(
                          //         'assets/image/certificate.png',
                          //         height: 25,
                          //         color: kcDarkAlt,
                          //       ),
                          //       SizedBox(
                          //         width: 20,
                          //       ),
                          //       Expanded(
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               'Saved Vaccine Certificates',
                          //               style: TextStyle(color: kcDarkAlt, fontWeight: FontWeight.bold, fontSize: 16),
                          //             ),
                          //             Text(
                          //               'All your vaccine certificates are available here',
                          //               style: TextStyle(color: kcDarkAlt, fontSize: 12),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Icon(
                          //         Icons.arrow_forward_ios_rounded,
                          //         color: kcInfo,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 40,
                          // ),
                          // Text('Not able to find a booking?'),
                          // Text(
                          //   'ADD BOOKING',
                          //   style: TextStyle(color: kcInfo, fontWeight: FontWeight.bold),
                          // )
                        ],
                      ),
                    ),
            ),
            BottomNavbarWidget(
              route: 'bookings',
            ),
          ],
        ),
      ),
    );
  }
}
