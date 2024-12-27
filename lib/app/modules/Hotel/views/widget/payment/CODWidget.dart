import 'package:flutter/material.dart';

import 'package:ui_x/helpers/ColorPalette.dart';


class CODWidget extends StatelessWidget {
  const CODWidget({Key? key, required this.onTap}) : super(key: key);
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      decoration: BoxDecoration(color: kcWhite, boxShadow: [
        BoxShadow(
          color: kcGray.withOpacity(0.8),
          blurRadius: 5,
          spreadRadius: 2

        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Row(

              children: [
                Image.asset("assets/icons/credit-card.png" ,width: 18,color: kcBlack,),
                SizedBox(width: 10,),
                Text("Cash On Delivery" ,style: TextStyle(color: kcBlack ,fontWeight: FontWeight.w600),),
                Spacer(),
                Icon((Icons.keyboard_arrow_up_outlined) ,size: 25,)

              ],
            ),
          ),
          SizedBox(height: 15,),

          TextField(
            decoration: InputDecoration(
              hintText: "Enter cde shown in above image*"
            ),
          ),
          SizedBox(height: 5,),

          Text("You can pay via Cash/UPI on delivery.",style: TextStyle(color: kcBlack.withOpacity(0.8) ,fontSize: 12),),
          InkWell(
            onTap: () {
             // var  value = getRandomNumber(5);
             // log.w(value);
            },
            child: Container(
                decoration: BoxDecoration(

                ),
              //  child: Text("${getRandomNumber(10)}",style: TextStyle(color: kcBlack.withOpacity(0.8) ,fontSize: 12,letterSpacing: 15),)),
          ),
          )

        ],
      ),
    );
  }
}
