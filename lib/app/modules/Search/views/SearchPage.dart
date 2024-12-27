import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../../Hotel/route/HotelRoutes.dart';
import '../controllers/SearchController.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchhController>(
      init: SearchhController(),
      builder: (SearchhController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
                ? LoadingIconWidget(message: "Please wait...")
                : ResponsiveUi(
                    mobile: MobileSearch(),
                    tablet: TabletSearch(),
                  );
      },
    );
  }
}

////+++++++++++++++++++++++++
////Mobile
////+++++++++++++++++++++++++
class MobileSearch extends StatelessWidget {
  const MobileSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      // toolbarHeight: 80,
      automaticallyImplyLeading: true,
      title: TextFormField(
        decoration: InputDecoration(
          fillColor: kcWhite.withOpacity(0.6),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "Search Here",
          // prefixIcon: Icon(Icons.arrow_back),
          suffixIcon: Icon(
            Icons.search,
            size: 25,
          ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                ...List.generate(8, (index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(HotelRoutes.hotelShow);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(color: kcWhite, boxShadow: [
                        BoxShadow(
                            color: kcDarkAlt.withOpacity(0.2),
                            blurRadius: 3,
                            spreadRadius: 2)
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: kcDarkAlt.withOpacity(0.1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                "assets/placeholders/hotel-placeholder.png",
                                width: double.maxFinite,
                                fit: BoxFit.contain,
                                height: 180,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hotel Shivani",
                                    style: TextStyl.bodySm?.copyWith(
                                        fontSize: 16,
                                        color: kcBlack.withOpacity(0.8),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: kcWarning.withOpacity(0.8),
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kcWarning.withOpacity(0.8),
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kcWarning.withOpacity(0.8),
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kcGray,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kcGray,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin),
                                      Text(
                                        "Seoni",
                                        style: TextStyl.bodySm
                                            ?.copyWith(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "10",
                                          style: TextStyl.bodySm?.copyWith(
                                              color:
                                                  kcDarkGreen.withOpacity(0.8),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "₹ 3000",
                                          style: TextStyle(
                                            color: kcDarkAlt,
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            // decorationColor: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "₹2500",
                                      style: TextStyl.bodySm?.copyWith(
                                          color: kcBlack,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          letterSpacing: 1),
                                    ),
                                    // Text(
                                    //   "+ ₹ ${favourite.tax}",
                                    //   style: TextStyl.bodySm
                                    //       ?.copyWith(color: kcDarkAlt,
                                    //       fontWeight: FontWeight.bold, fontSize: 12),
                                    // ),
                                    // SizedBox(height: 2),
                                    // Text(
                                    //   "${favourite.duration}",
                                    //   style: TextStyle(
                                    //     color: kcButton,
                                    //     fontSize: 10,
                                    //   ),
                                    // ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Per Room Per Night",
                                      style: TextStyle(
                                        color: kcBlack.withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////+++++++++++++++++++++++++
////Tablet
////+++++++++++++++++++++++++
class TabletSearch extends StatelessWidget {
  const TabletSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      // toolbarHeight: 80,
      automaticallyImplyLeading: true,
      title: TextFormField(
        decoration: InputDecoration(
          fillColor: kcWhite.withOpacity(0.6),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "Search Here",
          // prefixIcon: Icon(Icons.arrow_back),
          suffixIcon: Icon(
            Icons.search,
            size: 25,
          ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                ...List.generate(8, (index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(HotelRoutes.hotelShow);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(color: kcWhite, boxShadow: [
                        BoxShadow(
                            color: kcDarkAlt.withOpacity(0.2),
                            blurRadius: 3,
                            spreadRadius: 2)
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: kcDarkAlt.withOpacity(0.1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                "assets/placeholders/hotel-placeholder.png",
                                width: double.maxFinite,
                                fit: BoxFit.contain,
                                height: 180,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hotel Shivani",
                                    style: TextStyl.bodySm?.copyWith(
                                        fontSize: 16,
                                        color: kcBlack.withOpacity(0.8),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  // Text(
                                  //   "(Near bus stand)",
                                  //   style: TextStyl.bodySm
                                  //       ?.copyWith(fontSize: 12, color: kcBlack.withOpacity(0.8),
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: kcWarning.withOpacity(0.8),
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kcWarning.withOpacity(0.8),
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kcWarning.withOpacity(0.8),
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kcGray,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: kcGray,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin),
                                      Text(
                                        "Seoni",
                                        style: TextStyl.bodySm
                                            ?.copyWith(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "10",
                                          style: TextStyl.bodySm?.copyWith(
                                              color:
                                                  kcDarkGreen.withOpacity(0.8),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "₹ 3000",
                                          style: TextStyle(
                                            color: kcDarkAlt,
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            // decorationColor: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "₹2500",
                                      style: TextStyl.bodySm?.copyWith(
                                          color: kcBlack,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          letterSpacing: 1),
                                    ),
                                    // Text(
                                    //   "+ ₹ ${favourite.tax}",
                                    //   style: TextStyl.bodySm
                                    //       ?.copyWith(color: kcDarkAlt,
                                    //       fontWeight: FontWeight.bold, fontSize: 12),
                                    // ),
                                    // SizedBox(height: 2),
                                    // Text(
                                    //   "${favourite.duration}",
                                    //   style: TextStyle(
                                    //     color: kcButton,
                                    //     fontSize: 10,
                                    //   ),
                                    // ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Per Room Per Night",
                                      style: TextStyle(
                                        color: kcBlack.withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
