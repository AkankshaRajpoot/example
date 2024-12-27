import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../helpers/Global.dart';
import '../../controllers/SelectRoomController.dart';
class RoomSelectWidget extends StatelessWidget {
  const RoomSelectWidget({Key? key, this.active=false,required this.roomType, required this.price, required this.discountPrice, required this.taxPrice, required this.adult, required this.meal, required this.controller, required this.onSelectTab}) : super(key: key);
  final String roomType;
  final String price;
  final String discountPrice;
  final String taxPrice;
  final String adult;
  final String meal;
  final SelectRoomController controller;
  final bool active;
final VoidCallback onSelectTab;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

          width: screen.width,
          decoration: BoxDecoration(
              color:active?   kcInfo.withOpacity(0.2): kcWhite,
              borderRadius: BorderRadius.circular(5),


            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$roomType',
                style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Icon(Icons.people),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Included for $adult Adults',
                            style: TextStyl.bodySm?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Row(
                      //   children: [
                      //     Image.asset(
                      //       'assets/image/check.png',
                      //       height: 10,
                      //       color: kcInfo,
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Text(
                      //       'Book @ 1',
                      //       style: TextStyl.bodySm?.copyWith(color: kcInfo, fontSize: 12),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Row(
                        children: [
                         Icon(Icons.circle,size: 5,color: kcDarkAlt,),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$meal',
                            style: TextStyl.bodySm?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.close,size: 12,color: kcDanger,),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Non-Refundable',
                            style: TextStyl.bodySm?.copyWith(color: kcDanger, fontSize: 12,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹$price',
                        style: TextStyl.bodySm?.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '+₹$taxPrice Taxes & Fees',
                        style: TextStyl.bodySm?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      active ?
                      Container(

                        child: Row(
                          children: [
                            Icon(Icons.check_circle, color: kcButton,size: 18,),
                            SizedBox(width: 3,),
                            Text(
                              'Selected',
                              style: TextStyl.bodySm?.copyWith(color: kcButton, fontSize: 12 , fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                      :
                      InkWell(
                        onTap: onSelectTab,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kcButton.withOpacity(0.1)
                          ),
                          child: Text(
                            'Select',
                            style: TextStyl.bodySm?.copyWith(color: kcButton, fontSize: 14 , fontWeight: FontWeight.w600),
                          ),
                        ),
                      )

                    ],
                  )
                ],
              ),

              InkWell(
                onTap: () {
                  controller.viewPlanDialogWidget();
                },
                child: Text(
                  'View plan Details & policies',
                  style: TextStyl.bodySm?.copyWith(color: kcPrimary, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
