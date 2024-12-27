import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/helpers/Global.dart';
import 'package:vishrampoint/app/modules/Home/models/HomeModel.dart';
import 'package:vishrampoint/app/modules/Home/controllers/HomeController.dart';
import 'package:vishrampoint/app/modules/Hotel/HotelModule.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return Container(
            width: screen.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: kcDarkAlt.withOpacity(0.3),
                    blurRadius: 2,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent Searches",
                  style: TextStyl.bodySm?.copyWith(
                      color: kcBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(controller.homeData.recentSearch!.length,
                          (index) {
                        RecentSearchModel recentSearch =
                            controller.homeData.recentSearch![index];
                        return InkWell(
                            onTap: () => Get.toNamed(HotelRoutes.hotelShow),
                            child: Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 180,
                                decoration: BoxDecoration(
                                    color: kcWhite,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: kcDarkAlt.withOpacity(0.2))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: kcDarkAlt.withOpacity(0.1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/placeholders/hotel-placeholder.png"),
                                            fit: BoxFit.contain,
                                          )),
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: kcBlack.withOpacity(0.5),
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          'assets/icons/close.png',
                                          color: kcWhite,
                                          width: 10,
                                          height: 10,
                                        ),
                                      ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                    //       decoration: BoxDecoration(
                                    //         color: kcDarkGreen,
                                    //         borderRadius: BorderRadius.circular(5),
                                    //       ),
                                    //       child: Row(
                                    //         children: [
                                    //           SvgPicture.asset(
                                    //             "assets/image/building.svg",
                                    //             color: kcWhite,
                                    //             width: 10,
                                    //           ),
                                    //           SizedBox(
                                    //             width: 5,
                                    //           ),
                                    //           Text(
                                    //             "Region",
                                    //             style: TextStyl.bodySm?.copyWith(color: kcWhite, fontWeight: FontWeight.bold, fontSize: 10),
                                    //           )
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     Spacer(),
                                    //     Icon(
                                    //       Icons.arrow_forward_ios_rounded,
                                    //       color: kcPrimaryDark,
                                    //       size: 14,
                                    //     ),
                                    //   ],
                                    // ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${recentSearch.district}",
                                            style: TextStyl.bodySm?.copyWith(
                                                color: kcBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            "${recentSearch.people}",
                                            style: TextStyl.bodySm?.copyWith(
                                                color: kcDarkAlt,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "${recentSearch.duration}",
                                            style: TextStyl.bodySm?.copyWith(
                                                color: kcBlack,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )));
                      })
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
