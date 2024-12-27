import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';
import 'package:vishrampoint/app/modules/Home/views/widget/DailyDealsWidget.dart';
import 'package:vishrampoint/app/modules/Home/views/widget/HotelNearYouWidget.dart';
import 'package:vishrampoint/app/modules/Home/views/widget/ImageSliderWidget.dart';
import 'package:vishrampoint/app/modules/Home/views/widget/RecentSearchWidget.dart';
import 'package:vishrampoint/app/modules/Home/views/widget/SearchWidget.dart';
import 'package:vishrampoint/app/modules/Modules.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/BottomNavbarWidget.dart';
import '../shimmer/HomeShimmer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : ResponsiveUi(
                mobile: MobileHome(
                  controller: controller,
                ),
                tablet: TabletHome(
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
class MobileHome extends StatelessWidget {
  const MobileHome({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: kcWhite,
        title: Image.asset(
          "assets/system/logo.png",
          width: 82,
          height: 82,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(NotificationRoutes.notification);
                  },
                  child: SvgPicture.asset(
                    "assets/icons/bell.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: () {
                    Get.toNamed(ProfileRoutes.profile);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kcDarkAlt, width: 1),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/placeholders/user-male.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          controller.scroller(notification);
          return true;
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: controller.isBusy
                    ? HomeShimmer()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Search Widget -----------------------
                              SearchWidget(
                                controller: controller,
                              ),
                              SizedBox(
                                height: 30,
                              ),

                              ///Image Slider Widget-------------------------
                              ImageSliderWidget(
                                length: controller.sliderOne,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              ///Hourly stay Widget -----------------------
                              InkWell(
                                onTap: () {
                                  Get.toNamed(HomeRoutes.hourly);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kcWhite,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kcDarkAlt.withOpacity(0.3),
                                          blurRadius: 2,
                                        )
                                      ]),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(38),
                                            bottomRight: Radius.circular(38),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: <Color>[
                                              kcButton.withOpacity(0.2),
                                              kcWhite
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "HOURLY",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color:
                                                      kcBlack.withOpacity(0.8),
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "STAYS",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color:
                                                      kcBlack.withOpacity(0.8),
                                                  fontSize: 13),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "BOOK FOR 3, 6 OR 9 HOURS!",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color: kcBlack,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Flexible slots great savings",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color:
                                                      kcBlack.withOpacity(0.8),
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: kcInfoDark,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 8,
                              ),

                              ///Recent Searches Widget -------------------------
                              RecentSearchWidget(),
                              SizedBox(
                                height: 8,
                              ),

                              ///Daily Deals Widget -------------------------
                              DailyDealsWidget(),
                              SizedBox(
                                height: 8,
                              ),

                              /// Hotel Near You Widget----------------------------------------------------
                              HotelNearYouWidget(),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              BottomNavbarWidget(
                route: 'home',
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

class TabletHome extends StatelessWidget {
  const TabletHome({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: kcWhite,
        title: Image.asset(
          "assets/system/logo.png",
          width: 85,
          height: 85,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(NotificationRoutes.notification);
                  },
                  child: SvgPicture.asset(
                    "assets/icons/bell.svg",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Get.toNamed(ProfileRoutes.profile);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kcBlack, width: 1),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/placeholders/user-male.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          controller.scroller(notification);
          return true;
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: controller.isBusy
                    ? HomeShimmer()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Search Widget -----------------------
                              SearchWidget(
                                controller: controller,
                              ),
                              SizedBox(
                                height: 30,
                              ),

                              ///Image Slider Widget-------------------------
                              ImageSliderWidget(
                                length: controller.sliderOne,
                              ),

                              SizedBox(
                                height: 8,
                              ),

                              ///Hourly stay Widget -----------------------
                              InkWell(
                                onTap: () {
                                  Get.toNamed(HomeRoutes.hourly);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kcWhite,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kcDarkAlt.withOpacity(0.3),
                                          blurRadius: 2,
                                        )
                                      ]),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(38),
                                            bottomRight: Radius.circular(38),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: <Color>[
                                              kcButton.withOpacity(0.2),
                                              kcWhite
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "HOURLY",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color:
                                                      kcBlack.withOpacity(0.8),
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "STAYS",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color:
                                                      kcBlack.withOpacity(0.8),
                                                  fontSize: 13),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "BOOK FOR 3, 6 OR 9 HOURS!",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color: kcBlack,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Flexible slots great savings",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color:
                                                      kcBlack.withOpacity(0.8),
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: kcInfoDark,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              //   ),
                              // ),
                              SizedBox(
                                height: 8,
                              ),

                              ///Recent Searches Widget -------------------------
                              RecentSearchWidget(),
                              SizedBox(
                                height: 8,
                              ),

                              ///Daily Deals Widget -------------------------
                              DailyDealsWidget(),
                              SizedBox(
                                height: 8,
                              ),

                              /// Hotel Near You Widget----------------------------------------------------
                              HotelNearYouWidget(),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              BottomNavbarWidget(
                route: 'home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
