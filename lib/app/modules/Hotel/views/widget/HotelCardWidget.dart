import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/modules/Hotel/HotelModule.dart';

import '../../models/HotelModel.dart';
import '../../route/HotelRoutes.dart';
import 'FacilityIncluded.dart';

class HotelCardWidget extends StatelessWidget {
  const HotelCardWidget({Key? key, required this.hotel}) : super(key: key);

  final HotelModel hotel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelController>(
      init: HotelController(),
      builder: (HotelController controller) {
        return InkWell(
          onTap: () {
            Get.toNamed(HotelRoutes.hotelShow);
          },
          child: SafeArea(
            child: Column(
              children: [
                    SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(color: kcWhite, boxShadow: [BoxShadow(color: kcDarkAlt.withOpacity(0.2), blurRadius: 3, spreadRadius: 2)]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
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
                              Positioned(
                                top: 15,
                                right: 15,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(color: kcBlack.withOpacity(0.5), shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    'assets/icons/heart.svg',
                                    color: kcWhite,
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(color: kcInfoDark, borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "3.9",
                                  style: TextStyl.title?.copyWith(color: kcWhite, fontWeight: FontWeight.w600, fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${hotel.reviews}",
                                style: TextStyl.bodySm?.copyWith(color: kcInfoDark, fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${hotel.ratings}",
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: kcDarkAlt),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${hotel.hotelName}",
                            style: TextStyl.bodySm?.copyWith(fontSize: 17, color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${hotel.location}",
                            style: TextStyl.bodySm,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              FacilityIncluded(label: 'Breakfast',),
                              FacilityIncluded(label: 'Lunch',),
                              FacilityIncluded(label: 'Free Wifi',),


                            ],
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Image.asset(
                                  //       "assets/image/tick.png",
                                  //       color: kcGreen,
                                  //       height: 12,
                                  //       width: 12,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 5,
                                  //     ),
                                  //     Text(
                                  //       "Breakfast Included",
                                  //       style: TextStyl.bodySm?.copyWith(color: kcGreen, fontSize: 13,
                                  //           fontWeight: FontWeight.normal),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: kcPrimary.withOpacity(0.1),
                                        // borderRadius: BorderRadius.only(topRight: Radius.circular(5),
                                        //     bottomRight: Radius.circular(5)),
                                        border: Border(
                                            left: BorderSide(
                                              color: kcInfoDark,
                                              width: 2.5,
                                            ))),
                                    child: Text(
                                      "RESORT",
                                      style: TextStyl.bodySm?.copyWith(color: kcInfoDark, fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(color: kcDanger, borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "20% Off",
                                      style: TextStyl.title?.copyWith(color: kcWhite, fontWeight: FontWeight.w600, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "₹ ${hotel.price}",
                                      style: TextStyle(
                                        color: kcDarkAlt,
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.red,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${hotel.discountprice}",
                                      style: TextStyl.bodySm?.copyWith(color: kcBlack, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1),
                                    ),
                                    Text(
                                      "+ ₹${hotel.tax}",
                                      style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                    Text(
                                      "${hotel.detail}",
                                      style: TextStyle(
                                        color: kcBlack,
                                        fontSize: 12,
                                      ),
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
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
