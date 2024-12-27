import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../helpers/Global.dart';

class CouponsWidget extends StatelessWidget {
  const CouponsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: kcWhite,borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                 Text(
                   "Welcome",
                   style: TextStyl.bodySm?.copyWith(
                       color: kcInfo, fontWeight: FontWeight.w600),
                 ),
                SizedBox(height: 10,),
                Text("50% OFF",
                  style: TextStyl.bodySm?.copyWith(
                      color: kcBlack, fontWeight: FontWeight.w600,fontSize: 18),),
                SizedBox(height: 10,),
                Text("Valid till 2 march 2023",
                  style: TextStyl.bodySm?.copyWith(
                      color: kcDarkAlt, fontWeight: FontWeight.w600,fontSize: 13),),
              ],
            ),
            Spacer(),
            Image.network("https://w7.pngwing.com/pngs/423/371/png-transparent-discounts-and-allowances-computer-icons-coupon-sale-miscellaneous-text-logo-thumbnail.png",
              height: 35,width: 35,),
          ],
        ),
      ),
    );
  }
}
