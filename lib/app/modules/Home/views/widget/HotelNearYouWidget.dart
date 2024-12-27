import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../helpers/Global.dart';
import '../../models/HomeModel.dart';
import '../../../Hotel/route/HotelRoutes.dart';
import '../../controllers/HomeController.dart';

class HotelNearYouWidget extends StatelessWidget {
  const HotelNearYouWidget({Key? key}) : super(key: key);

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
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[kcLightPink, kcLightPink, kcWhite],
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
                            "Hotels Near You",
                            style: TextStyle(color: kcBlack, fontWeight: FontWeight.w600, fontSize: 16),
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
                        style: TextStyle(color: kcBlack, fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    ...List.generate(controller.homeData.hotelNearYou!.length, (index) {
                      HotelNearYou near = controller.homeData.hotelNearYou![index];
                      return InkWell(
                        onTap: () => Get.toNamed(HotelRoutes.hotelShow),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          width: screen.width * 0.55,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)), color: kcWhite, border: Border.all(color: kcOffWhite)),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: kcDarkAlt.withOpacity(0.1),
                                margin: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/placeholders/hotel-placeholder.png",
                                    width: double.maxFinite,
                                    fit: BoxFit.contain,
                                    height: 150,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${near.hotelName}",
                                      style: TextStyle(fontSize: 15, color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${near.hotelLocation}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: kcDarkAlt,fontWeight: FontWeight.w500, fontSize: 12),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "₹${near.price}",
                                      style: TextStyl.bodySm
                                          ?.copyWith(fontWeight: FontWeight.w600, color: kcDanger.withOpacity(0.8), fontSize: 15),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                  ]),
                )
              ],
            ));
      }
    );
  }
}
