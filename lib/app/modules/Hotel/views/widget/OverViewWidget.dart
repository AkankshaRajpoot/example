import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/modules/Hotel/controllers/HotelShowController.dart';

import '../../../../helpers/Global.dart';
import '../../models/HotelModel.dart';
import '../../../../shared/views/widgets/ContainerWidget.dart';
import 'OffersWidget.dart';
import 'RulesWidget.dart';
import 'ShowPageWidget.dart';

class OverViewWidget extends StatelessWidget {
  const OverViewWidget({Key? key, required this.controller}) : super(key: key);
  final HotelShowController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelShowController>(
      init: HotelShowController(),
      builder: (HotelShowController controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ...List.generate(4, (index) {
                            return Icon(
                              Icons.star,
                              color: kcWarning.withOpacity(0.8),
                              size: 15,
                            );
                          }),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Hotel",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: kcBlack, fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcLightPink),
                              child: Row(
                                children: [
                                  Text(
                                    '20% off',
                                    style: TextStyle(fontSize: 14, color: kcDanger,fontWeight: FontWeight.bold),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 2 ,left: 3),
                                    child: Icon(Icons.info ,color: kcDanger, size: 13,),
                                  )
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${controller.hotelShow.overView!.hotelName}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                            decoration: BoxDecoration(color: kcGreen, borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  '3.9',
                                  style: TextStyle(fontSize: 14, color: kcWhite ,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '/5',
                                  style: TextStyle(fontSize: 14, color: kcWhite),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: (){
                              controller.onScrollTaps(3);
                            },
                            child: Text(
                              '235 Ratings',
                              style: TextStyl.bodySm?.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: kcDarkGray),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screen.width,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(border: Border.all(color: kcDarkAlt.withOpacity(0.1)), borderRadius: BorderRadius.circular(5)),


                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: kcDarkAlt,size: 18,),
                            SizedBox(width: 5,),
                            Text(
                              'Ward No.03, Main Road,Barapathar,Seoni',
                              style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcBlack),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(border: Border.all(color: kcDarkAlt.withOpacity(0.1)), borderRadius: BorderRadius.circular(5)),


                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                Text(
                                  '₹2489',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                                  style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 14),
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
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        width: screen.width,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(border: Border.all(color: kcDarkAlt.withOpacity(0.1)), borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Our best offers includes',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.credit_card_outlined,
                                  color: kcDarkAlt,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${controller.hotelShow.overView!.offers}',
                                  style: TextStyle(fontSize: 14, color: kcBlack.withOpacity(0.8)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              ContainerWidget(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Highlights",
                        style: TextStyl.bodySm?.copyWith(
                            color: kcBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                                   Image.asset(
                                                    "assets/icons/air-conditioner.png",
                                                    height: 30,
                                                    fit: BoxFit.cover,
                                                     color: kcDarkAlt,
                                                  ),
                                SizedBox(height: 5,),
                                Text(
                                  'Air conditioning',
                                  style: TextStyle(fontSize: 14, color: kcBlack.withOpacity(0.8)),
                                ),
                              ],
                            ),
                            SizedBox(width: 15,),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/icons/cleaner.png",
                                  height: 30,
                                  fit: BoxFit.cover,
                                  color: kcDarkAlt,
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  'Daily housekeeping',
                                  style: TextStyle(fontSize: 14, color: kcBlack.withOpacity(0.8)),
                                ),
                              ],
                            ),
                            SizedBox(width: 15,),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/icons/cleaner.png",
                                  height: 30,
                                  fit: BoxFit.cover,
                                  color: kcDarkAlt,
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  'Sparkling clean',
                                  style: TextStyle(fontSize: 14, color: kcBlack.withOpacity(0.8)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    // ...List.generate(3, (index) {
                    //   return Padding(
                    //     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    //     child: Row(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             width: 100,
                    //             decoration: BoxDecoration(
                    //               color: kcOffWhite,
                    //               borderRadius: BorderRadius.circular(5),
                    //             ),
                    //             child: Column(
                    //               children: [
                    //                 ClipRRect(
                    //                   child: Image.asset(
                    //                     "assets/icons/hotel.jfif",
                    //                     height: 70,
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                   borderRadius: BorderRadius.only(
                    //                       topLeft: Radius.circular(5),
                    //                       topRight: Radius.circular(5)),
                    //                 ),
                    //                 Padding(
                    //                   padding:
                    //                   const EdgeInsets.symmetric(vertical: 12),
                    //                   child: Row(
                    //                     crossAxisAlignment:
                    //                     CrossAxisAlignment.center,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Icon(
                    //                         Icons.star,
                    //                         color: kcDarkGreen,
                    //                         size: 12,
                    //                       ),
                    //                       SizedBox(width: 2),
                    //                       Text(
                    //                         "5",
                    //                         style: TextStyl.bodySm?.copyWith(
                    //                             color: kcDarkGreen,
                    //                             fontWeight: FontWeight.bold,
                    //                             fontSize: 12),
                    //                       ),
                    //                       Text(
                    //                         "/5",
                    //                         style: TextStyl.bodySm?.copyWith(
                    //                             color: kcDarkGreen, fontSize: 12),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           Expanded(
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   'Restaurant/Coffee Shop',
                    //                   style: TextStyl.bodySm?.copyWith(
                    //                     fontWeight: FontWeight.w600,
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   height: 15,
                    //                 ),
                    //                 Text(
                    //                   '100% of customers liked the Room Service',
                    //                   style: TextStyl.bodySm?.copyWith(),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ]),
                    //   );
                    // })
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: screen.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            'Property Policies',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),

                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kcDarkGray,size: 15,
                          ),

                        ],
                      ),
                    ),
                    Divider(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check in',
                                style: TextStyle(color: kcBlack.withOpacity(0.7) ,fontSize: 13),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                '14:00 PM',
                                style: TextStyle(fontWeight: FontWeight.bold ,color: kcBlack.withOpacity(0.8),fontSize: 13),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                'Check out',
                                style: TextStyle(color: kcBlack.withOpacity(0.7),fontSize: 13),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                '10:00 PM',
                                style: TextStyle(fontWeight: FontWeight.bold,color: kcBlack.withOpacity(0.8),fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: InkWell(
                        onTap: (){
                          controller.onScrollTaps(2);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Read full Policy',
                              style: TextStyle(color: kcInfo, fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                            SizedBox(width: 5,),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: kcInfo, size: 14,
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
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hotel Rules',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,letterSpacing: 1 ,color: kcBlack),
                    ),
                    Divider(),
                    ...List.generate(controller.hotelShow.overView!.rules!.length, (index) {
                      Rule hotelRule = controller.hotelShow.overView!.rules![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: RulesWidget(
                          rule: '${hotelRule.hotelRules}',
                        ),
                      );
                    }),
                    // Divider(color: kcDarkAlt.withOpacity(0.5),),
                    //
                    // Row(
                    //   children: [
                    //     Text(
                    //       'View 41 more Hotel Rules',
                    //       style: TextStyl.bodySm?.copyWith(color: kcInfo, fontWeight: FontWeight.bold, fontSize: 14),
                    //     ),
                    //     Icon(
                    //       Icons.arrow_forward_ios_rounded,
                    //       color: kcInfo,
                    //       weight: 20,
                    //     )
                    //   ],
                    // ),

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: screen.width,
                padding: EdgeInsets.symmetric( vertical: 15),
                decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12,),
                      child: Row(
                        children: [
                          Text(
                            'Similar properties',
                            style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.bold ,fontSize: 15),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kcInfoDark,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(color: kcDarkAlt.withOpacity(0.5),),
                    ShowPageWidget()

                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
