import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/widgets/forms/FormInput.dart';

import '../../controllers/HotelShowController.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({Key? key, required this.controller}) : super(key: key);
  final HotelShowController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: FormInput(

                            placeholder: "Enter Coupon Code",
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                          decoration: BoxDecoration(
                            color: kcButton,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text("Apply" , style: TextStyl.body?.copyWith(color: kcWhite),),
                        )
                      ],
                    ),

                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: kcDarkAlt.withOpacity(0.3)),
                        bottom: BorderSide(color: kcDarkAlt.withOpacity(0.3)),
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "PROMOCODE",
                          style: TextStyl.bodySm?.copyWith(color: kcDanger, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OfferCode(
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
          ]
                ),
          ),
        ],
      ),
    );
  }
}

class OfferCode extends StatelessWidget {
  const OfferCode({Key? key, required this.controller}) : super(key: key);
  final HotelShowController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            ...List.generate(2, (index) {
              return InkWell(
                onTap: () {
                  controller.onSelectOffer(index);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 280,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.selectOfferRadio == index ? kcLightGreen : kcWhite,
                      border: Border.all(color: kcOffWhite)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 30,
                        child: Radio(
                          value: index,
                          groupValue: controller.selectOfferRadio,
                          onChanged: (value) => controller.onSelectOffer(index),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5), color: controller.selectOfferRadio == index ? kcWhite : kcLightGreen),
                                  child: Text(
                                    index == 0 ? "WELCOME" : "GOYES",
                                    style: TextStyl.bodySm?.copyWith(color: kcGreen, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '-₹209',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kcGreen),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Apply to avail this EXCLUSIVE offer onn your first hotel booking",
                              style: TextStyle(fontSize: 12, color: kcBlack),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
