import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({Key? key, required this.onTap}) : super(key: key);
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      decoration: BoxDecoration(color: kcWhite,
      //     boxShadow: [
      //   BoxShadow(
      //     color: kcGray.withOpacity(0.8),
      //     blurRadius: 5,
      //     spreadRadius: 2
      //
      //   ),
      // ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Row(

              children: [
                Image.asset("assets/icons/credit_card.png" ,width: 18,color: kcPrimary,),
                SizedBox(width: 10,),
                Text("Credit/Debit Card" ,style: TextStyle(color: kcBlack ,fontWeight: FontWeight.w600),),
                Spacer(),
                Icon((Icons.keyboard_arrow_up_outlined) ,size: 25,)

              ],
            ),
          ),
          SizedBox(height: 15,),
          Text("Please ensure your card can be used for online\n transactions.",style: TextStyle(color: kcDarkAlt),),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              hintText: "Card Number"
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
                hintText: "Name on card"
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(

                      hintText: "Valid Thru (MM/YY) "
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: TextField(

                  decoration: InputDecoration(
                      hintText: "CVV ",

                    suffixIcon: Icon(Icons.info_outline ,color: kcDarkAlt.withOpacity(0.5),)
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
