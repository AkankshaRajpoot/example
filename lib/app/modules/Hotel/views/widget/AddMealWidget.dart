import 'package:flutter/material.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';

import '../../controllers/SelectRoomController.dart';

class AddMealWidget extends StatelessWidget {
  const AddMealWidget({Key? key, required this.controller}) : super(key: key);

  final SelectRoomController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(color: kcWhite, border: Border(top: BorderSide(color: kcGray.withOpacity(0.5)))),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icons/lunch.png",
                color: kcDarkGray,
                height: 18,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Add Meals',
                style: TextStyl.bodySm?.copyWith(color: kcDarkGray, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(),
          Row(
            children: [
              SizedBox(
                height: 32,
                child: Checkbox(
                  value: controller.isChecked,
                  onChanged: (value) {
                    controller.isCheck = value ?? true;
                  },

                ),
              ),
              Text(
                'Free Breakfast',
                style: TextStyl.bodySm?.copyWith(color: kcBlack, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 32,
                child: Checkbox(
                  value: controller.isChecked,
                  onChanged: (value) {
                    controller.isCheck = value ?? true;
                  },

                ),
              ),
              Text(
                'Breakfast & Lunch/Dinner Included',
                style: TextStyl.bodySm?.copyWith(color: kcBlack, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Text(
                'Clear All',
                style: TextStyl.bodySm?.copyWith(color: kcDarkGray, fontWeight: FontWeight.w600, fontSize: 14),
              ),
              InkWell(
                onTap: () {
                 // Get.toNamed(HotelRoutes.review);
                },
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(color: kcButton, borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Apply',
                    style: TextStyle(color: kcWhite, fontWeight: FontWeight.bold),
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
