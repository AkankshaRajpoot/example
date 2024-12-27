import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:vishrampoint/app/helpers/Global.dart';
import 'package:vishrampoint/app/modules/Home/HomeModule.dart';
import 'package:vishrampoint/app/modules/Home/controllers/HomeController.dart';
import 'package:vishrampoint/app/shared/views/layouts/MasterLayout.dart';

import '../widget/RoomWidget.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return
            MasterLayout(
            title: 'Add Travellers',
            titleSpacing: 0,
            backgroundColor: kcBackground,
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
                                BoxShadow(
                                  color: kcDarkAlt.withOpacity(0.3),
                                  blurRadius: 2,
                                )
                              ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RoomWidget(
                                    onAddTab: () {
                                      controller.onCountRoom(add: true);
                                    },
                                    onRemoveTab: () {
                                      controller.onCountRoom(add: false);
                                    },
                                    quantity: '${controller.countRoom}',
                                    category: 'Rooms',
                                  ),
                                  Divider(
                                    color: kcGray,
                                  ),
                                  RoomWidget(

                                    category: 'Adults',
                                    onAddTab: () {
                                      controller.onCountAdult(add: true);
                                    },
                                    onRemoveTab: () {
                                      controller.onCountAdult(add: false);
                                    },
                                    quantity: '${controller.countAdult}',
                                  ),
                                  Divider(
                                    color: kcGray,
                                  ),
                                  RoomWidget(
                                    onAddTab: () {
                                      controller.onCountChildren(add: true);
                                    },
                                    onRemoveTab: () {
                                      controller.onCountChildren(add: false);
                                    },
                                    showAge: true,
                                    category: 'Children',
                                    quantity: '${controller.countChildren}',
                                  ),

                                  ...List.generate(controller.count.length, (index) {
                                    var count = controller.count[index];
                                    return   Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: SingleChildScrollView(
                                         child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                           Divider(),
                                            Text(
                                              "Child $count Age",
                                              style: TextStyl.bodySm?.copyWith(color:  controller.selectAge == 0 ? kcDanger.withOpacity(0.8) : kcBlack),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ...List.generate(12, (index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        controller.onSelectAge(index);
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(right: 5,bottom: 5),
                                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                                        decoration: BoxDecoration(
                                                          color: controller.selectAge == index ? kcInfoDark : kcInfo.withOpacity(0.15),
                                                          borderRadius: BorderRadius.circular(3),
                                                        ),
                                                        child: Text(
                                                          "$index",
                                                          style: TextStyl.bodySm?.copyWith(
                                                            color: controller.selectAge == index ? kcWhite : kcBlack ,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  })
                                                ],
                                              ),
                                            ),
                                            controller.selectAge == 0 ?
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Please provide age of the child",
                                                  style: TextStyl.bodySm?.copyWith(color:  kcDanger.withOpacity(0.8)),
                                                ),
                                              ],
                                            )
                                                :SizedBox.shrink()
                                          ],
                                        ),
                                      ),
                                    );
                                  })

                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: screen.width,
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
                                BoxShadow(
                                  color: kcDarkAlt.withOpacity(0.3),
                                  blurRadius: 2,
                                )
                              ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Travel Preference(Optional)',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.onSelectPreference(1);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            color: kcInfo.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 28,
                                                height: 32,
                                                child: Transform.scale(
                                                  scale: 0.9,
                                                  child: Radio(
                                                    value: 1,
                                                    groupValue: controller.selectPreference,
                                                    onChanged: (value) => controller.onSelectPreference(1),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Couples',
                                                style: TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.onSelectPreference(2);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                            color: kcInfo.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 28,
                                                height: 32,
                                                child: Transform.scale(
                                                  scale: 0.9,
                                                  child: Radio(
                                                    value: 2,
                                                    groupValue: controller.selectPreference,
                                                    onChanged: (value) => controller.onSelectPreference(2),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Family',
                                                style: TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  controller.selectPreference == 1
                                      ? Text(
                                          "Local IDs Accepted, Unmarried Couples Allowed, Private Booking",
                                          style: TextStyle(color: kcBlack.withOpacity(0.8), fontSize: 12),
                                        )
                                      : controller.selectPreference == 2
                                          ? Text(
                                              "goStays are handpicked properties that have been top rated by travellers for best in travel experience",
                                              style: TextStyle(color: kcBlack.withOpacity(0.8), fontSize: 12),
                                            )
                                          : Text(
                                              '80% travellers get their preferred stay by choosing travel style',
                                              style: TextStyle(fontSize: 12, color: kcBlack.withOpacity(0.8)),
                                            )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screen.width,
                  decoration: BoxDecoration(color: kcWhite),
                  child: InkWell( onTap:  () {
                    Get.toNamed(HomeRoutes.home);
                  },
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: kcButton,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Done',
                          style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.bold, fontSize: 15, color: kcWhite),
                        )),
                  ),
                )
              ],
            ),
          );
        });
  }
}
