import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../helpers/Global.dart';

class HourlyWidget extends StatelessWidget {
  const HourlyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: screen.width,
          decoration: BoxDecoration(
              color: kcWhite,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: kcDarkAlt.withOpacity(0.3),
                  blurRadius: 2,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Where do you want to go?",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: kcDarkAlt, fontSize: 12),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 23,
                      color: kcDarkAlt,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "City, Area or Landmark",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: kcDarkAlt,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(SingleChildScrollView(
                            child: Container(
                              width: screen.width,
                              decoration: BoxDecoration(
                                color: kcWhite,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Allow Location access",
                                        style: TextStyle(
                                            color: kcBlack,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 12),
                                    Text(
                                        "Enable us to enhance your in-app experience",
                                        style: TextStyle(
                                            color: kcDarkAlt,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(height: 15),
                                    Container(
                                      width: screen.width,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: kcInfo.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 155,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    color: kcGray
                                                        .withOpacity(0.8))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'No, Not Now',
                                                  style: TextStyl.bodySm
                                                      ?.copyWith(
                                                          color: kcDarkAlt),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          width: 155,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                  color:
                                                      kcGray.withOpacity(0.8))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Give Permission',
                                                style: TextStyl.bodySm
                                                    ?.copyWith(
                                                        color: kcDarkAlt),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: kcInfo.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Near me',
                            style: TextStyle(color: kcInfo, fontSize: 13),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        child: Container(
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: kcInfo.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Chennai',
                            style: TextStyle(color: kcInfo, fontSize: 13),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        child: Container(
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: kcInfo.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Dehli',
                            style: TextStyle(color: kcInfo, fontSize: 13),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        child: Container(
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: kcInfo.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Bangalore',
                            style: TextStyle(color: kcInfo, fontSize: 13),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        child: Container(
                          alignment: Alignment.center,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: kcInfo.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Bhopal',
                            style: TextStyle(color: kcInfo, fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Text("Check-in Date",
                    style: TextStyle(color: kcDarkAlt, fontSize: 12)),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text("16 May",
                        style: TextStyle(
                            color: kcBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    SizedBox(width: 15),
                    Container(
                      child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            color: kcInfo.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Today',
                          style: TextStyle(color: kcInfo, fontSize: 13),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            color: kcInfo.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Tomorrow',
                          style: TextStyle(color: kcInfo, fontSize: 13),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            color: kcInfo.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Other',
                          style: TextStyle(color: kcInfo, fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                Text("Check-in Time",
                    style: TextStyle(color: kcDarkAlt, fontSize: 12)),
                SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Select Check-in Time",
                                style: TextStyle(
                                    color: kcBlack,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "For tomorrow, 17 May 2023",
                                style:
                                    TextStyle(color: kcDarkAlt, fontSize: 13),
                              ),
                              Divider(),
                              SizedBox(height: 6),
                              Column(
                                children: [
                                  ...List.generate(5, (index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: screen.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: kcGray.withOpacity(0.5),
                                        ),
                                      ),
                                      child: Text("10 am to 12 pm",style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w600),),
                                    );
                                  })
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                      child: Text("10:00 AM",
                          style: TextStyle(
                              color: kcBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w600))),
                ),
                SizedBox(width: 12),
                Divider(),
                SizedBox(height: 8),
                Text("2 Adults in 1 Room Change",
                    style: TextStyle(
                        color: kcDarkAlt,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: kcButton),
            child: Text(
              "Search Hourly Stays",
              style: TextStyl.bodySm?.copyWith(
                  color: kcWhite, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
