import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../helpers/Global.dart';
import '../../route/BookingsRoutes.dart';
import 'EditBottomSheetWidget.dart';

class CompleteWidget extends StatelessWidget {
  const CompleteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Get.toNamed(BookingsRoutes.bookingDetails);
        },
        child: Container(
          width: screen.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
            BoxShadow(
              color: kcDarkAlt.withOpacity(0.3),
              blurRadius: 2,
            )
          ]),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: kcDarkAlt.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage("assets/placeholders/hotel-placeholder.png",),
                          fit: BoxFit.contain,
                        )),
                  ),
                  Expanded(

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: TextStyle(color: kcDarkAlt, fontSize: 12),
                              ),
                            ],
                          ),
                          Text(
                            "Hotel Prince Viraj",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: kcBlack, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "7873-79 Akanksha Road Seoni Barapathar ",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: kcBlack.withOpacity(0.8), fontSize: 13),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: kcGreen,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                child: Text(
                                  "3.5/5",
                                  style: TextStyl.bodySm?.copyWith(color: kcWhite),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "554 Verified Rating",
                                style: TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Check in",
                        style: TextStyle(color: kcDarkAlt, fontSize: 13),
                      ),
                      Text(
                        "Sat, 20 May 2023",
                        style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "12:00 pm",
                        style: TextStyle(color: kcDarkAlt, fontSize: 13),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Check out",
                        style: TextStyle(color: kcDarkAlt, fontSize: 13),
                      ),
                      Text(
                        "Sat, 22 May 2023",
                        style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "12:00 pm",
                        style: TextStyle(color: kcDarkAlt, fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
