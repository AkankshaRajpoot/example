import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:vishrampoint/app/helpers/Global.dart';


class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({Key? key, required this.active,
    // required this.notification
  }) : super(key: key);

  // final NotificationsModel notification;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 3.5),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(8),
        color: active ? kcDarkAlt.withOpacity(0.2): kcWhite,
        // border: Border.all(color: kcDarkAlt, width: 0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/placeholders/hotel-icon.png"),
                    fit: BoxFit.contain)),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Good Time for a trip to Seoni",
                  // '${notification.title}',
                  style: TextStyle(
                    color: kcBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5,),
                Text(
                  "So hurry, Book a hotel in seoni @ up to 25% OFF",
                  // "${notification.notification ?? 'gfvhghvhg'}",
                  style: TextStyle(color: kcBlack.withOpacity(0.6), fontSize: 13),
                ),
                SizedBox(height: 5,),
                Text("1d ago", style: TextStyle(color: kcBlack.withOpacity(0.6), fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
