import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/modules/Hotel/models/HotelModel.dart';
import 'package:vishrampoint/app/modules/Hotel/controllers/HotelShowController.dart';

import '../../../../helpers/Global.dart';
import '../../route/HotelRoutes.dart';

class ShowPageWidget extends StatelessWidget {
  const ShowPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelShowController>(
      init: HotelShowController(),
      builder: (HotelShowController controller) {
        return InkWell(
          onTap: (){
            Get.toNamed(HotelRoutes.hotelShow);
          },
          child: Container(
            width: screen.width,
            padding: const EdgeInsets.symmetric( vertical: 8 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(controller.hotelShow.overView!.similar!.length, (index) {
                        Similar properties = controller.hotelShow.overView!.similar![index];
                        return  Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),

                          width: screen.width * 0.55,
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: kcWhite,
                              border: Border.all(color: kcOffWhite)),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: kcDarkAlt.withOpacity(0.1),

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/placeholders/hotel-placeholder.png",

                                    fit: BoxFit.contain,
                                    height: 120,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Column(
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
                                        style: TextStyle(color: kcBlack, fontSize: 12),
                                      ),
                                       Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                                        decoration: BoxDecoration(color: kcGreen, borderRadius: BorderRadius.circular(2)),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          textBaseline: TextBaseline.ideographic,
                                          children: [
                                            Text(
                                              '3.9',
                                              style: TextStyle(fontSize: 12, color: kcWhite ,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '/5',
                                              style: TextStyle(fontSize: 12, color: kcWhite,fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    "${properties.hotelName}",
                                    style: TextStyle(fontSize: 14, color: kcBlack, fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "${properties.hotelLocation}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: kcBlack, fontSize: 12),
                                  ),
                                  Text(
                                    "${properties.cancellation}",
                                    style: TextStyl.bodySm?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,color: kcInfo
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "₹ ${properties.price}",
                                    style: TextStyle(
                                      color: kcDarkAlt,
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    textBaseline: TextBaseline.ideographic,

                                    children: [
                                      Text(
                                        "₹ ${properties.discount}",
                                        style: TextStyl.bodySm
                                            ?.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
                                      ),
                                      Text(
                                        "+ ₹${properties.tax}",
                                        style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${properties.details}",
                                    style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      })
                    ],
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
