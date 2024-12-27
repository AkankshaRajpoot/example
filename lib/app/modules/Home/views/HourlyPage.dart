import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:vishrampoint/app/modules/Home/views/widget/AnswersWidget.dart';
import 'package:vishrampoint/app/modules/Home/views/widget/HourlyWidget.dart';
import 'package:vishrampoint/app/modules/Home/views/widget/ImageSliderWidget.dart';

import '../../../helpers/Global.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../controllers/HourlyController.dart';

class HourlyPage extends StatelessWidget {
  const HourlyPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HourlyController>(
        init: HourlyController(),
      builder: (HourlyController controller) {
        return ResponsiveUi(
          mobile: MobileHourly(
            controller: controller,
          ),
          tablet: TabletHourly(
            controller: controller,
          ),
        );
      }
    );
  }
}
////+++++++++++++++++++++++++
////Mobile
////+++++++++++++++++++++++++
class MobileHourly extends StatelessWidget {
  const MobileHourly({super.key, required this.controller});
  final HourlyController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackground,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kcWhite,
        title: Text("Hourly Stays"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImageSliderWidget(
                length: controller.sliderOne,
              ),
              SizedBox(height: 10),
              HourlyWidget(),
              SizedBox(height: 40),
              Container(
                width: screen.width,
                decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
                  BoxShadow(
                    color: kcDarkAlt.withOpacity(0.3),
                    blurRadius: 2,
                  ),
                ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Frequently Asked Question", style: TextStyle(color: kcBlack, fontSize: 16,
                              fontWeight: FontWeight.w600)),
                          SizedBox(height: 25),
                          InkWell(
                            onTap: () => controller.onTabAnswers(),
                            child: Row(
                              children: [
                                Text("What are Hourly Stays?"),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: kcBlack,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Obx(()=> Visibility(
                              visible: controller.answers,
                              child: AnswersWidget())),
                          SizedBox(height: 8),
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("What are Hourly Stays?"),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kcBlack,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("What are Hourly Stays?"),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kcBlack,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("What are Hourly Stays?"),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kcBlack,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("What are Hourly Stays?"),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kcBlack,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
////+++++++++++++++++++++++++
////Tablet
////+++++++++++++++++++++++++

class TabletHourly extends StatelessWidget {
  const TabletHourly({super.key, required this.controller});
  final HourlyController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackground,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kcWhite,
        title: Text("Hourly Stays"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImageSliderWidget(
                length: controller.sliderOne,
              ),
              SizedBox(height: 10),
              HourlyWidget(),
              SizedBox(height: 40),
              Container(
                width: screen.width,
                decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
                  BoxShadow(
                    color: kcDarkAlt.withOpacity(0.3),
                    blurRadius: 2,
                  ),
                ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Frequently Asked Question", style: TextStyle(color: kcBlack, fontSize: 16,
                              fontWeight: FontWeight.w600)),
                          SizedBox(height: 25),
                          InkWell(
                            onTap: () => controller.onTabAnswers(),
                            child: Row(
                              children: [
                                Text("What are Hourly Stays?"),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: kcBlack,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Obx(()=> Visibility(
                              visible: controller.answers,
                              child: AnswersWidget())),
                          SizedBox(height: 8),
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("What are Hourly Stays?"),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kcBlack,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("What are Hourly Stays?"),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kcBlack,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("What are Hourly Stays?"),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kcBlack,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text("What are Hourly Stays?"),
                              Spacer(),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kcBlack,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
