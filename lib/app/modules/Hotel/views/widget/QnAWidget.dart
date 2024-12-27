import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../../../shared/views/widgets/ContainerWidget.dart';
import '../../route/HotelRoutes.dart';

class QnAWidget extends StatelessWidget {
  const QnAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcWhite),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Frequently asked question',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: kcBlack.withOpacity(0.8)),
                ),
                Spacer(),
                FilterQnAWidget(
                  onTap: () => Get.toNamed(HotelRoutes.askQnA),
                  title: "Ask",
                  icon: Icons.add,
                  downArrow: false,
                ),
              ],
            ),
          ),

          /// QnA Widget Card
          QnACardWidget(),
        ],
      ),
    );
  }
}

class FilterQnAWidget extends StatelessWidget {
  const FilterQnAWidget({Key? key, required this.title, required this.icon, this.downArrow = true, this.onTap}) : super(key: key);
  final String title;
  final IconData icon;
  final bool downArrow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
        decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), border: Border.all(color: kcDarkAlt.withOpacity(0.2))),
        child: Row(
          children: [
            Icon(
              icon,
              color: kcDarkAlt,
              size: 18,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              "$title",
              style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontSize: 12),
            ),
            if (downArrow)
              Icon(
                Icons.keyboard_arrow_down_sharp,
                size: 15,
                color: kcDarkAlt,
              ),
          ],
        ),
      ),
    );
  }
}

class QnACardWidget extends StatelessWidget {
  const QnACardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Checkin-Checkout Timings",
            style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "what is the checkin time in hotel? please send the msg",
                  style: TextStyl.bodySm?.copyWith(color: kcBlack, fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              PopupMenuButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                icon: Image.asset(
                  "assets/icons/menu-dots-vertical.png",
                  width: 16,
                  color: kcDarkAlt,
                ),
                itemBuilder: (context) {
                  return <PopupMenuEntry<int>>[
                    PopupMenuItem(child: Text('Report'), value: 0),
                  ];
                },
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Re-asked by 4 travellers",
            style: TextStyl.bodySm?.copyWith(color: kcPrimary, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2 Answers",
                style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kcPrimary.withOpacity(0.1),
                ),
                child: Text(
                  "Ask Again",
                  style: TextStyl.bodySm?.copyWith(color: kcPrimary, fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kcPrimary.withOpacity(0.1),
                ),
                child: Text(
                  "Answer",
                  style: TextStyl.bodySm?.copyWith(color: kcPrimary, fontWeight: FontWeight.w600, fontSize: 15),
                ),
              )
            ],
          ),
          Divider(
            color: kcDarkAlt.withOpacity(0.2),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kcBackground,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kcDarkAlt.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "HP",
                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Hotel Shivani Palace",
                      style: TextStyl.bodySm?.copyWith(color: kcDarkGray, fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.verified,
                      color: kcDarkGray,
                    ),
                    Spacer(),
                    PopupMenuButton(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      icon: Image.asset(
                        "assets/icons/menu-dots-vertical.png",
                        width: 16,
                        color: kcDarkAlt,
                      ),
                      itemBuilder: (context) {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem(child: Text('Report'), value: 0),
                        ];
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Standard check in time is noon, but if you need early check in that can be arranged on request",
                  style: TextStyl.bodySm?.copyWith(color: kcBlack, fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "View all answers",
                style: TextStyl.bodySm?.copyWith(color: kcPrimary, fontWeight: FontWeight.w600, fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: kcPrimary,
                size: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
