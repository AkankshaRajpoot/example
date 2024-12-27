import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';
import 'package:ui_x/widgets/forms/DateRangePickerForm.dart';
import 'package:vishrampoint/app/modules/Home/controllers/HomeController.dart';
import 'package:vishrampoint/app/modules/Modules.dart';
import 'package:vishrampoint/app/modules/Search/route/SearchRoutes.dart';

import '../../route/HomeRoutes.dart';
import '../SearchLocationDialog.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {Key? key, required this.controller, this.activeColor = false})
      : super(key: key);

  final HomeController controller;
  final bool activeColor;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: kcWhite,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: kcDarkAlt.withOpacity(0.3),
                      blurRadius: 2,
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => SearchLocationDialog(
                      placeholder: "Select Location",
                      value: controller.locationSelect,
                      onChanged: (value) {
                        controller.onSelectLocation(value);
                      },
                      options: [
                        DropDownItems(value: 0, label: "Select Location"),
                        DropDownItems(value: 1, label: "Seoni"),
                        DropDownItems(value: 2, label: "Jabalpur"),
                        DropDownItems(value: 3, label: "Select Location"),
                      ],
                    ),
                  ),
                  Divider(
                    color: kcGray.withOpacity(0.5),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DateRangePickerForm(
                          startDate: DateTime(DateTime.now().year - 1, 1, 1),
                          endDate: DateTime(DateTime.now().year + 1, 12, 31),
                          initialRange: DateTimeRange(
                              start: controller.selectedFromDate,
                              end: controller.selectedToDate),
                          onChanged: (DateTimeRange? dateRange) {
                            if (dateRange != null) {
                              controller.onSelectFromDate(dateRange.start);
                              controller.onSelectToDate(dateRange.end);
                            }
                          },
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 0.3,
                        color: kcGray.withOpacity(0.5),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(HomeRoutes.rooms);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "1 Rooms",
                                style: TextStyle(
                                    color: kcBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "4 Adults 2 Children",
                                style:
                                    TextStyle(color: kcDarkAlt, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: kcGray.withOpacity(0.5),
                  ),
                  Text(
                    "Select your travel preference",
                    style: TextStyle(
                        color: kcBlack.withOpacity(0.8), fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.onSelectPreference(0);
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: controller.selectPreference == 0
                                      ? kcPrimary.withOpacity(0.8)
                                      : kcGray.withOpacity(0.8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 32,
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: Radio(
                                    value: 0,
                                    groupValue: controller.selectPreference,
                                    onChanged: (value) =>
                                        controller.onSelectPreference(0),
                                  ),
                                ),
                              ),
                              Text(
                                'Couples',
                                style:
                                    TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          controller.onSelectPreference(1);
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: controller.selectPreference == 1
                                      ? kcPrimary.withOpacity(0.8)
                                      : kcGray.withOpacity(0.8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 32,
                                child: Transform.scale(
                                  scale: 0.7,
                                  child: Radio(
                                    // focusColor: kcGray,
                                    // activeColor: kcGray,
                                    // fillColor:
                                    // MaterialStateColor.resolveWith((states) => kcPrimary.withOpacity(0.7)),
                                    value: 1,
                                    groupValue: controller.selectPreference,
                                    onChanged: (value) =>
                                        controller.onSelectPreference(1),
                                  ),
                                ),
                              ),
                              Text(
                                'Family',
                                style:
                                    TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  controller.selectPreference == 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Local IDs Accepted, Unmarried Couples Allowed, Private Booking",
                            style: TextStyle(
                                color: kcBlack.withOpacity(0.8), fontSize: 12),
                          ),
                        )
                      : controller.selectPreference == 1
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "goStays are handpicked properties that have been top rated by travellers for best in travel experience",
                                style: TextStyle(
                                    color: kcBlack.withOpacity(0.8),
                                    fontSize: 12),
                              ),
                            )
                          : SizedBox.shrink(),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              child: Obx(
                () => InkWell(
                  onTap: () {
                    controller.onSearchLoadingButton();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.searchButtonLoading
                            ? kcOffWhite
                            : kcButton),
                    child: controller.searchButtonLoading
                        ? LoadingIcon()
                        : Text(
                            "Search",
                            style: TextStyl.bodySm?.copyWith(
                                color: kcWhite,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
