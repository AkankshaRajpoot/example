import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ui_x/helpers/ColorPalette.dart';

import '../../../controllers/ReviewController.dart';

class NetbankingWidget extends StatelessWidget {
  const NetbankingWidget({
    Key? key,
    required this.onTap,
    required this.controller,
  }) : super(key: key);
  final VoidCallback onTap;
  final ReviewController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: kcWhite,
        //     boxShadow: [
        //   BoxShadow(color: kcGray.withOpacity(0.8), blurRadius: 5, spreadRadius: 2),
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
                Image.asset(
                  "assets/icons/banking.png",
                  width: 18,
                  color: kcPrimary,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Netbanking",
                  style: TextStyle(color: kcBlack, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(
                  (Icons.keyboard_arrow_up_outlined),
                  size: 25,
                )
              ],
            ),
          ),
          Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: RadioListTile(
                        activeColor: kcDanger,
                        // title: Text("Axis Bank"),
                        value: 0,
                        groupValue: controller.selectBank,
                        onChanged: (value) {
                          controller.onSelectBank(0);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Axis Bank"),
                    )
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: RadioListTile(
                        activeColor: kcDanger,
                        value: 1,
                        groupValue: controller.selectBank,
                        onChanged: (value) {
                          controller.onSelectBank(1);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("HDFC Bank"),
                    )
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: RadioListTile(
                        activeColor: kcDanger,
                        value: 2,
                        groupValue: controller.selectBank,
                        onChanged: (value) {
                          controller.onSelectBank(2);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("ICICI Bank"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
