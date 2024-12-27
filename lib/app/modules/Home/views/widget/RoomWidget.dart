import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({Key? key, this.category, this.quantity , this.showAge = false,  this.onRemoveTab, this.onAddTab}) : super(key: key);

  final String? category;
  final String? quantity;
  final bool showAge;
  final VoidCallback?  onRemoveTab ;
  final VoidCallback?  onAddTab ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
      child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$category',style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold),),
               if(showAge)
                Text(
                  "Age 0-12 years",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: kcBlack.withOpacity(0.8), fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: kcInfo)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap : onRemoveTab,
                      child: Image.asset('assets/icons/minus.png',height: 20,width :15, color: kcInfoDark,)),
                  SizedBox(width: 10,),
                  Text("$quantity",style: TextStyle(color: kcInfoDark ,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: onAddTab,
                      child: Image.asset('assets/icons/add.png',height: 20,color: kcInfoDark,)),
                ],
              ),
            )
          ],
        ),
    );

  }
}
