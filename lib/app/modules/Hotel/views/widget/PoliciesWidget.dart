import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/shared/views/widgets/ContainerWidget.dart';

import '../../../../helpers/Global.dart';

class PoliciesWidget extends StatelessWidget {
  const PoliciesWidget({Key? key, required this.title, required this.policy}) : super(key: key);
  final String title;
  final policy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ContainerWidget(widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Children and extra beds",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color:
                      kcBlack.withOpacity(0.8)),
                ),
                SizedBox(
                  height: 5,
                ),
              Text(
                'Extra beds are dependent on the room you choose. Please check the individual room capacity for more details.',
                style: TextStyl.bodySm?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kcBlack.withOpacity(0.8)
                ),
              ),

              ],
            ),),

          SizedBox(
            height: 10,
          ),
          ContainerWidget(widget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Check-in/Check-out",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color:
                    kcBlack.withOpacity(0.8)),
              ),


              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/tick.png',
                    height: 10,
                    color: kcDarkAlt,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Check-in from: 12:00 PM',
                  style: TextStyl.bodySm?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kcBlack.withOpacity(0.8)
                ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/tick.png',
                    height: 10,
                    color: kcDarkAlt,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Check-in until: 08:00 PM',
                  style: TextStyl.bodySm?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kcBlack.withOpacity(0.8)
                ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/tick.png',
                    height: 10,
                    color: kcDarkAlt,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Check-out from: 10:00 AM',
                  style: TextStyl.bodySm?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kcBlack.withOpacity(0.8)
                ),
                  ),
                ],
              ),
            ],
          ),),
        ],
      ),
    );
  }
}
