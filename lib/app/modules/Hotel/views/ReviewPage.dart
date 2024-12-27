import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/widgets/forms/FormInputBorderNone.dart';
import 'package:vishrampoint/app/helpers/Global.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/OffersWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/ReviewDateRangaForm.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/payment/CreditCardWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/payment/NetbankingWidget.dart';
import 'package:vishrampoint/app/modules/Hotel/views/widget/payment/PaymentOptionWidget.dart';
import 'package:vishrampoint/app/shared/views/layouts/MasterLayout.dart';

import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../controllers/ReviewController.dart';
import '../route/HotelRoutes.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ReviewController(),
        builder: (ReviewController controller) {
          return ResponsiveUi(
            mobile: MobileReview(
              controller: controller,
            ),
            tablet: TabletReview(
              controller: controller,
            ),
          );
        });
  }
}

///+++++++++++++++++++++++++
///Mobile
///+++++++++++++++++++++++++
class MobileReview extends StatelessWidget {
  const MobileReview({super.key, required this.controller});

  final ReviewController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review Booking',
            style: TextStyl.bodySm
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '30 mar - 31 mar, 2 Adults',
            style: TextStyl.bodySm?.copyWith(
                fontSize: 12, color: kcDarkAlt, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          controller.scroller(notification);
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: screen.width,
                        decoration: BoxDecoration(
                            color: kcWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: kcDarkAlt.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/placeholders/hotel-placeholder.png"),
                                        fit: BoxFit.contain,
                                      )),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ...List.generate(4, (index) {
                                              return Icon(
                                                Icons.star,
                                                color:
                                                    kcWarning.withOpacity(0.8),
                                                size: 14,
                                              );
                                            }),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Hotel",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: kcDarkAlt,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Hotel Prince Viraj",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: kcBlack,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "7873-79 Akanksha Road Seoni Barapathar ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: kcBlack.withOpacity(0.8),
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: kcGreen,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 3),
                                              child: Text(
                                                "3.5/5",
                                                style: TextStyl.bodySm
                                                    ?.copyWith(color: kcWhite),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "554 Verified Rating",
                                              style: TextStyl.bodySm
                                                  ?.copyWith(color: kcDarkAlt),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Obx(
                              () => ReviewDateRangeForm(
                                dateFormat: "EEE, dd MMM yyyy",
                                startDate:
                                    DateTime(DateTime.now().year - 1, 1, 1),
                                endDate:
                                    DateTime(DateTime.now().year + 1, 12, 31),
                                initialRange: DateTimeRange(
                                    start: controller.selectedFromDate,
                                    end: controller.selectedToDate),
                                onChanged: (DateTimeRange? dateRange) {
                                  if (dateRange != null) {
                                    controller
                                        .onSelectFromDate(dateRange.start);
                                    controller.onSelectToDate(dateRange.end);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: screen.width,
                        decoration: BoxDecoration(
                            color: kcWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '1 Room for 2 Adults',
                              style: TextStyl.bodySm?.copyWith(),
                            ),
                            Divider(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: kcInfo.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Super Delux Room',
                                        style: TextStyl.bodySm?.copyWith(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.people),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '2 Adults',
                                            style: TextStyl.bodySm
                                                ?.copyWith(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Rooms Only',
                                            style: TextStyl.bodySm
                                                ?.copyWith(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Container(
                                            height: 15,
                                            width: 1,
                                            color: kcInfo,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "Free cancellation",
                                            style: TextStyl.bodySm?.copyWith(
                                                color: kcInfo, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/placeholders/hotel-placeholder.png",
                                    fit: BoxFit.contain,
                                    height: 50,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  color: kcWhite,
                                  border: Border.all(
                                      color: kcDarkAlt.withOpacity(0.2)),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: kcInfo,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Free cancellation on your booking",
                                        style: TextStyl.bodySm?.copyWith(
                                            color: kcInfo, fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Cancel Anytime before",
                                            style: TextStyl.bodySm?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "29 mar 2023",
                                            style: TextStyl.bodySm
                                                ?.copyWith(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: kcInfo,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   width: screen.width,
                      //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //   decoration: BoxDecoration(
                      //       color: kcBlack, borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Property Rules & Policies",
                      //         style: TextStyl.bodySm?.copyWith(color: kcWhite),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   width: screen.width,
                      //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //   decoration: BoxDecoration(
                      //       color: kcWhite,
                      //       border: Border.all(color: kcDarkAlt.withOpacity(0.2)),
                      //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       ...List.generate(5, (index) {
                      //         return Container(
                      //           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      //           child: RulesWidget(
                      //             rule: "Covid test report is mandatory",
                      //           ),
                      //         );
                      //       }),
                      //       SizedBox(
                      //         height: 5,
                      //       ),
                      //       Text(
                      //         "+41 More rules and policies",
                      //         style: TextStyl.bodySm?.copyWith(color: kcInfo, fontSize: 12, fontWeight: FontWeight.w900),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kcWhite),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Traveller Details",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                Spacer(),
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      controller.onAddressHide();
                                    },
                                    child: Text(
                                      controller.hideAddress
                                          ? "Done"
                                          : "Change",
                                      style: TextStyl.bodySm
                                          ?.copyWith(color: kcInfo),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Obx(
                              () => Visibility(
                                visible: controller.hideAddress,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Name",
                                                style: TextStyl.bodySm
                                                    ?.copyWith(
                                                        color: kcPrimary),
                                              ),
                                              FormInputBorderNone(
                                                placeholder: "Mr",
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "First Name",
                                                style: TextStyl.bodySm
                                                    ?.copyWith(
                                                        color: kcDarkAlt
                                                            .withOpacity(0.5)),
                                              ),
                                              FormInputBorderNone(
                                                placeholder: "First Name",
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Last Name",
                                                style: TextStyl.bodySm
                                                    ?.copyWith(
                                                        color: kcDarkAlt
                                                            .withOpacity(0.5)),
                                              ),
                                              FormInputBorderNone(
                                                placeholder: "Last Name",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Phone",
                                      style: TextStyl.bodySm
                                          ?.copyWith(color: kcPrimary),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "+91",
                                          style: TextStyl.bodySm?.copyWith(
                                              color:
                                                  kcDarkAlt.withOpacity(0.5)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: FormInputBorderNone.number(
                                            placeholder: "Phone Number",
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Email",
                                      style: TextStyl.bodySm
                                          ?.copyWith(color: kcPrimary),
                                    ),
                                    FormInputBorderNone.email(
                                      placeholder: "Email",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                visible: !controller.hideAddress,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcDarkAlt,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "Phone",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcDarkAlt,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "Email",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcDarkAlt,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Mayank Sarathe",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcBlack.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "7489532678",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcBlack.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "chetanghogre28@hotmail.com",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcBlack.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "We'll send your booking info on your mobile and email",
                              style: TextStyl.bodySm?.copyWith(
                                  color: kcDarkAlt.withOpacity(0.8),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kcWhite,
                        ),
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Offers",
                                    style: TextStyl.bodySm?.copyWith(
                                        color: kcBlack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  InkWell(
                                      onTap: () {
                                        controller.onSelectHideButton();
                                      },
                                      child: Icon(
                                        !controller.hideEditButton
                                            ? Icons.keyboard_arrow_down_sharp
                                            : Icons.keyboard_arrow_up,
                                        size: 22,
                                        color: kcDarkAlt,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Promo-code / zHotel offers / Bank offers",
                                style: TextStyl.bodySm?.copyWith(
                                    color: kcDarkAlt,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              controller.hideEditButton
                                  ? Container(
                                      child: Column(
                                        children: [
                                          Divider(),
                                          OffersWidget(
                                            controller:
                                                controller.hotelShowController,
                                          )
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kcWhite),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Pricing Details",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: kcInfo,
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                Spacer(),
                                Text(
                                  "₹3589",
                                  style: TextStyl.bodySm?.copyWith(
                                    color: kcBlack,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Discount Price",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                Spacer(),
                                Text(
                                  "₹2489",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "All inclusive price with taxes & fees",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcDarkAlt, fontSize: 12),
                                ),
                                Spacer(),
                                Text(
                                  "+₹248",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcDanger,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Payable Now",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                Spacer(),
                                Text(
                                  "₹2689",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kcWhite),
                        child: Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Through",
                                style: TextStyl.bodySm?.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Divider(),
                              !controller.selectCredit
                                  ? PaymentOptionWidget(
                                      onTap: () {
                                        controller.isSelectCredit();
                                      },
                                      label: "Credit/Debit Card",
                                      image: "assets/icons/credit_card.png",
                                    )
                                  : CreditCardWidget(
                                      onTap: () {
                                        controller.isSelectCredit();
                                      },
                                    ),
                              Divider(
                                color: kcGray,
                              ),
                              !controller.selectNetbanking
                                  ? PaymentOptionWidget(
                                      onTap: () {
                                        controller.isSelectNetbanking();
                                      },
                                      label: "Netbanking",
                                      image: "assets/icons/banking.png",
                                    )
                                  : NetbankingWidget(
                                      onTap: () {
                                        controller.isSelectNetbanking();
                                      },
                                      controller: controller,
                                    ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: screen.width,
              decoration: BoxDecoration(
                color: kcWhite,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '₹2489',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "₹ 2,500",
                            style: TextStyle(
                              color: kcDarkAlt.withOpacity(0.7),
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'per night',
                            style: TextStyl.bodySm
                                ?.copyWith(color: kcDarkAlt, fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            '+₹489 Taxes & Fees',
                            style: TextStyl.bodySm?.copyWith(fontSize: 12),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          // Container(
                          //   height: 10,
                          //   width: 1,
                          //   color: kcDarkAlt,
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // Text(
                          //   '2 offers applied',
                          //   style: TextStyl.bodySm?.copyWith(color: kcInfo, fontSize: 12),
                          // ),
                          // Icon(
                          //   Icons.keyboard_arrow_up_rounded,
                          //   color: kcInfo,
                          //   size: 20,
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.hideScroller,
                      child: Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.onHideScroller();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                                color: kcButton,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Text(
                                  'Confirm',
                                  style: TextStyl.bodySm
                                      ?.copyWith(color: kcWhite, fontSize: 16),
                                ),
                                Text(
                                  'Traveller Details',
                                  style: TextStyl.bodySm
                                      ?.copyWith(color: kcWhite, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: !controller.hideScroller,
                      child: Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(HotelRoutes.thankYou);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                                color: kcButton,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Text(
                                  'Proceed',
                                  style: TextStyl.bodySm
                                      ?.copyWith(color: kcWhite, fontSize: 16),
                                ),
                                Text(
                                  'Make Payment',
                                  style: TextStyl.bodySm
                                      ?.copyWith(color: kcWhite, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

///+++++++++++++++++++++++++
///Tablet
///+++++++++++++++++++++++++
class TabletReview extends StatelessWidget {
  const TabletReview({super.key, required this.controller});

  final ReviewController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review Booking',
            style: TextStyl.bodySm
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '30 mar - 31 mar, 2 Adults',
            style: TextStyl.bodySm?.copyWith(
                fontSize: 12, color: kcDarkAlt, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          controller.scroller(notification);
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: screen.width,
                        decoration: BoxDecoration(
                            color: kcWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: kcDarkAlt.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/placeholders/hotel-placeholder.png"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ...List.generate(4, (index) {
                                              return Icon(
                                                Icons.star,
                                                color:
                                                    kcWarning.withOpacity(0.8),
                                                size: 14,
                                              );
                                            }),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Hotel",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: kcDarkAlt,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Hotel Prince Viraj",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: kcBlack,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "7873-79 Akanksha Road Seoni Barapathar ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: kcBlack.withOpacity(0.8),
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: kcGreen,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 3),
                                              child: Text(
                                                "3.5/5",
                                                style: TextStyl.bodySm
                                                    ?.copyWith(color: kcWhite),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "554 Verified Rating",
                                              style: TextStyl.bodySm
                                                  ?.copyWith(color: kcDarkAlt),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Obx(
                              () => ReviewDateRangeForm(
                                dateFormat: "EEE, dd MMM yyyy",
                                startDate:
                                    DateTime(DateTime.now().year - 1, 1, 1),
                                endDate:
                                    DateTime(DateTime.now().year + 1, 12, 31),
                                initialRange: DateTimeRange(
                                    start: controller.selectedFromDate,
                                    end: controller.selectedToDate),
                                onChanged: (DateTimeRange? dateRange) {
                                  if (dateRange != null) {
                                    controller
                                        .onSelectFromDate(dateRange.start);
                                    controller.onSelectToDate(dateRange.end);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: screen.width,
                        decoration: BoxDecoration(
                            color: kcWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '1 Room for 2 Adults',
                              style: TextStyl.bodySm?.copyWith(),
                            ),
                            Divider(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: kcInfo.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Super Delux Room',
                                        style: TextStyl.bodySm?.copyWith(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.people),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '2 Adults',
                                            style: TextStyl.bodySm
                                                ?.copyWith(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Rooms Only',
                                            style: TextStyl.bodySm
                                                ?.copyWith(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Container(
                                            height: 15,
                                            width: 1,
                                            color: kcInfo,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "Free cancellation",
                                            style: TextStyl.bodySm?.copyWith(
                                                color: kcInfo, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/placeholders/hotel-placeholder.png",
                                    fit: BoxFit.contain,
                                    height: 50,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  color: kcWhite,
                                  border: Border.all(
                                      color: kcDarkAlt.withOpacity(0.2)),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: kcInfo,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Free cancellation on your booking",
                                        style: TextStyl.bodySm?.copyWith(
                                            color: kcInfo, fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Cancel Anytime before",
                                            style: TextStyl.bodySm?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "29 mar 2023",
                                            style: TextStyl.bodySm
                                                ?.copyWith(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: kcInfo,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   width: screen.width,
                      //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //   decoration: BoxDecoration(
                      //       color: kcBlack, borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Property Rules & Policies",
                      //         style: TextStyl.bodySm?.copyWith(color: kcWhite),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   width: screen.width,
                      //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //   decoration: BoxDecoration(
                      //       color: kcWhite,
                      //       border: Border.all(color: kcDarkAlt.withOpacity(0.2)),
                      //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       ...List.generate(5, (index) {
                      //         return Container(
                      //           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      //           child: RulesWidget(
                      //             rule: "Covid test report is mandatory",
                      //           ),
                      //         );
                      //       }),
                      //       SizedBox(
                      //         height: 5,
                      //       ),
                      //       Text(
                      //         "+41 More rules and policies",
                      //         style: TextStyl.bodySm?.copyWith(color: kcInfo, fontSize: 12, fontWeight: FontWeight.w900),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kcWhite),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Traveller Details",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                Spacer(),
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      controller.onAddressHide();
                                    },
                                    child: Text(
                                      controller.hideAddress
                                          ? "Done"
                                          : "Change",
                                      style: TextStyl.bodySm
                                          ?.copyWith(color: kcInfo),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Obx(
                              () => Visibility(
                                visible: controller.hideAddress,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Name",
                                                style: TextStyl.bodySm
                                                    ?.copyWith(
                                                        color: kcPrimary),
                                              ),
                                              FormInputBorderNone(
                                                placeholder: "Mr",
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "First Name",
                                                style: TextStyl.bodySm
                                                    ?.copyWith(
                                                        color: kcDarkAlt
                                                            .withOpacity(0.5)),
                                              ),
                                              FormInputBorderNone(
                                                placeholder: "First Name",
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Last Name",
                                                style: TextStyl.bodySm
                                                    ?.copyWith(
                                                        color: kcDarkAlt
                                                            .withOpacity(0.5)),
                                              ),
                                              FormInputBorderNone(
                                                placeholder: "Last Name",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Phone",
                                      style: TextStyl.bodySm
                                          ?.copyWith(color: kcPrimary),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "+91",
                                          style: TextStyl.bodySm?.copyWith(
                                              color:
                                                  kcDarkAlt.withOpacity(0.5)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: FormInputBorderNone.number(
                                            placeholder: "Phone Number",
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Email",
                                      style: TextStyl.bodySm
                                          ?.copyWith(color: kcPrimary),
                                    ),
                                    FormInputBorderNone.email(
                                      placeholder: "Email",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                visible: !controller.hideAddress,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcDarkAlt,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "Phone",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcDarkAlt,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "Email",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcDarkAlt,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Mayank Sarathe",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcBlack.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "7489532678",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcBlack.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "chetanghogre28@hotmail.com",
                                          style: TextStyl.bodySm?.copyWith(
                                              color: kcBlack.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "We'll send your booking info on your mobile and email",
                              style: TextStyl.bodySm?.copyWith(
                                  color: kcDarkAlt.withOpacity(0.8),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kcWhite,
                        ),
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Offers",
                                    style: TextStyl.bodySm?.copyWith(
                                        color: kcBlack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  InkWell(
                                      onTap: () {
                                        controller.onSelectHideButton();
                                      },
                                      child: Icon(
                                        !controller.hideEditButton
                                            ? Icons.keyboard_arrow_down_sharp
                                            : Icons.keyboard_arrow_up,
                                        size: 22,
                                        color: kcDarkAlt,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Promo-code / zHotel offers / Bank offers",
                                style: TextStyl.bodySm?.copyWith(
                                    color: kcDarkAlt,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              controller.hideEditButton
                                  ? Container(
                                      child: Column(
                                        children: [
                                          Divider(),
                                          OffersWidget(
                                            controller:
                                                controller.hotelShowController,
                                          )
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kcWhite),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Pricing Details",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: kcInfo,
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                Spacer(),
                                Text(
                                  "₹3589",
                                  style: TextStyl.bodySm?.copyWith(
                                    color: kcBlack,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Discount Price",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                Spacer(),
                                Text(
                                  "₹2489",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "All inclusive price with taxes & fees",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcDarkAlt, fontSize: 12),
                                ),
                                Spacer(),
                                Text(
                                  "+₹248",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcDanger,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Payable Now",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                Spacer(),
                                Text(
                                  "₹2689",
                                  style: TextStyl.bodySm?.copyWith(
                                      color: kcBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kcWhite),
                        child: Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment Through",
                                style: TextStyl.bodySm?.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Divider(),
                              !controller.selectCredit
                                  ? PaymentOptionWidget(
                                      onTap: () {
                                        controller.isSelectCredit();
                                      },
                                      label: "Credit/Debit Card",
                                      image: "assets/icons/credit_card.png",
                                    )
                                  : CreditCardWidget(
                                      onTap: () {
                                        controller.isSelectCredit();
                                      },
                                    ),
                              Divider(
                                color: kcGray,
                              ),
                              !controller.selectNetbanking
                                  ? PaymentOptionWidget(
                                      onTap: () {
                                        controller.isSelectNetbanking();
                                      },
                                      label: "Netbanking",
                                      image: "assets/icons/banking.png",
                                    )
                                  : NetbankingWidget(
                                      onTap: () {
                                        controller.isSelectNetbanking();
                                      },
                                      controller: controller,
                                    ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: screen.width,
              decoration: BoxDecoration(
                color: kcWhite,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '₹2489',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "₹ 2,500",
                            style: TextStyle(
                              color: kcDarkAlt.withOpacity(0.7),
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'per night',
                            style: TextStyl.bodySm
                                ?.copyWith(color: kcDarkAlt, fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            '+₹489 Taxes & Fees',
                            style: TextStyl.bodySm?.copyWith(fontSize: 12),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          // Container(
                          //   height: 10,
                          //   width: 1,
                          //   color: kcDarkAlt,
                          // ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          // Text(
                          //   '2 offers applied',
                          //   style: TextStyl.bodySm?.copyWith(color: kcInfo, fontSize: 12),
                          // ),
                          // Icon(
                          //   Icons.keyboard_arrow_up_rounded,
                          //   color: kcInfo,
                          //   size: 20,
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.hideScroller,
                      child: Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.onHideScroller();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                                color: kcButton,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Text(
                                  'Confirm',
                                  style: TextStyl.bodySm
                                      ?.copyWith(color: kcWhite, fontSize: 16),
                                ),
                                Text(
                                  'Traveller Details',
                                  style: TextStyl.bodySm
                                      ?.copyWith(color: kcWhite, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: !controller.hideScroller,
                      child: Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(HotelRoutes.thankYou);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                                color: kcButton,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                Text(
                                  'Proceed',
                                  style: TextStyl.bodySm
                                      ?.copyWith(color: kcWhite, fontSize: 16),
                                ),
                                Text(
                                  'Make Payment',
                                  style: TextStyl.bodySm
                                      ?.copyWith(color: kcWhite, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
