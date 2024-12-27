import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/ui_x.dart';

class AskQnAWidget extends StatelessWidget {
  const AskQnAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimary,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Image.asset(
                "assets/icons/close.png",
                width: 15,
                height: 15,
                color: kcWhite,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              "Ask Question",
              style: TextStyl.bodySm?.copyWith(color: kcWhite, fontSize: 20),
            ),
            Spacer(),
            Text(
              "POST",
              style: TextStyl.bodySm?.copyWith(color: kcWhite, fontSize: 20),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: kcDarkAlt.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "VK",
                      style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vartika Kesharwani",
                        style: TextStyl.bodySm?.copyWith(color: kcDarkGray, fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      Text(
                        "Asks",
                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: FormInput.multiline(
                rows: 5,
                placeholder: "What is your question?",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
