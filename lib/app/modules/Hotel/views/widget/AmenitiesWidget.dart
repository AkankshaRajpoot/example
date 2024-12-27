import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../helpers/Global.dart';

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: screen.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: kcWhite, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Languages spoken',
                  style: TextStyl.bodySm?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(

                    amenities: "English"),
                Divider(),
                TextWidget(amenities: "Hindi"),

              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: screen.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: kcWhite, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Dining, drinking, and snacking',
                  style: TextStyl.bodySm?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(

                    amenities: "Alternative Meal Arrangement"),
                Divider(),
                TextWidget(amenities: "Breakfast service"),
                Divider(),
                TextWidget(amenities: "Restaurants"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: screen.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: kcWhite, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Services',
                  style: TextStyl.bodySm?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(

                    amenities: "Luggage Assistance"),
                Divider(),
                TextWidget(amenities: "Laundry Services"),
                Divider(),
                TextWidget(amenities: "Medical Centre"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: screen.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: kcWhite, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'General',
                  style: TextStyl.bodySm?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(amenities: "Air Condition"),
                Divider(),
                TextWidget(amenities: "Conference Rooms"),
                Divider(),
                TextWidget(amenities: "Smoke Alarms"),
                // ...List.generate(5, (index) {
                //   return Text(
                //     'AirCondition',
                //     style: TextStyl.bodySm?.copyWith(
                //       fontSize: 12,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   );
                // }),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: screen.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: kcWhite, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Room',
                  style: TextStyl.bodySm?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(amenities: "Electrical Charge"),
                Divider(),
                TextWidget(amenities: "TV",),
                Divider(),
                TextWidget(amenities: "Telephone",),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: screen.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: kcWhite, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Other',
                  style: TextStyl.bodySm?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(amenities: "Caretaker",),
                Divider(),
                TextWidget(amenities: "Torch",),
                Divider(),
                TextWidget(amenities: "Umbrellas",)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.amenities,}) : super(key: key);

  final String amenities;
//  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(Icons.wifi,   color: kcBlack.withOpacity(0.6)),
        SizedBox(width: 10,),

        Text(
          '$amenities',
          style: TextStyl.bodySm?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kcBlack.withOpacity(0.8)
          ),
        ),
      ],
    );
  }
}
