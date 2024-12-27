import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/modules/Home/models/HomeModel.dart';

import '../../../../helpers/Global.dart';
import '../../../Hotel/route/HotelRoutes.dart';
import '../../controllers/HomeController.dart';

class DailyDealsWidget extends StatelessWidget {
  const DailyDealsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return Container(
            width: screen.width,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: kcDarkAlt.withOpacity(0.3),
                  blurRadius: 2,
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[kcLightPink, kcLightPink, kcLightPink, kcWhite],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Daily Steal Deals",
                            style: TextStyle(
                                color: kcBlack,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () => Get.toNamed(HotelRoutes.hotel),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: kcBlack,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Lowest ever prices on top-rated hotels",
                        style: TextStyle(
                            color: kcBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(controller.homeData.dailyDeal!.length,
                          (index) {
                        DailyDealModel dailyDeal =
                            controller.homeData.dailyDeal![index];
                        return InkWell(
                          onTap: () => Get.toNamed(HotelRoutes.hotelShow),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            //height: screen.height * 0.45,
                            width: screen.width * 0.55,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: kcWhite,
                                border: Border.all(color: kcOffWhite)),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  color: kcDarkAlt.withOpacity(0.1),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/placeholders/hotel-placeholder.png",
                                      width: double.maxFinite,
                                      fit: BoxFit.contain,
                                      height: 120,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 6, right: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ...List.generate(4, (index) {
                                            return Icon(
                                              Icons.star,
                                              color: kcWarning.withOpacity(0.8),
                                              size: 14,
                                            );
                                          }),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Hotel",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: kcBlack, fontSize: 12),
                                          ),
                                          Spacer(),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: kcDarkGreen,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "4.3/5",
                                              style: TextStyl.bodySm?.copyWith(
                                                  color: kcWhite,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "${dailyDeal.hotelName}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: kcBlack.withOpacity(0.8),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${dailyDeal.hotelLocation}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: kcDarkAlt,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Image.asset(
                                              "assets/icons/check.png",
                                              color: kcWarning,
                                              height: 12,
                                              width: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Flexible(
                                              child: Text(
                                            "${dailyDeal.hotelReviews}",
                                            style: TextStyl.bodySm?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "₹${dailyDeal.discount}",
                                            style: TextStyle(
                                              color: kcDarkAlt,
                                              fontSize: 11,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "₹${dailyDeal.price}",
                                            style: TextStyl.bodySm?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: kcDanger.withOpacity(0.8),
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "+ ₹ ${dailyDeal.tax}",
                                        style: TextStyl.bodySm?.copyWith(
                                            color: kcDarkAlt,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Steal deals on great brands",
                        style: TextStyle(
                            color: kcBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: kcWhite,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: kcButton.withOpacity(0.4)),
                            ),
                            height: 70,
                            width: 120,
                            child: Image.asset(
                              "assets/icons/lemontree.png",
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 70,
                            width: 120,
                            decoration: BoxDecoration(
                              color: kcWhite,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: kcButton.withOpacity(0.4)),
                            ),
                            child: Image.asset(
                              "assets/icons/tree.png",
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
