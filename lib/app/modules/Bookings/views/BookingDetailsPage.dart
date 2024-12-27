import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/widgets/buttons/Button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../helpers/Global.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../controllers/BookingsController.dart';

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BookingsController(),
        builder: (BookingsController controller) {
          return !controller.isConnected
              ? NotConnectedErrorPage()
              : ResponsiveUi(
            mobile: MobileBookingDetails(
              controller: controller,
            ),
            tablet: TabletBookingDetails(
              controller: controller,
            ),
          );
        });
  }
}

///+++++++++++++++++++++++++
///Mobile
///+++++++++++++++++++++++++
class MobileBookingDetails extends StatelessWidget {
  const MobileBookingDetails({super.key, required this.controller});

  final BookingsController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcBackground,
      titleSpacing: 0,
      title: "Booking Details",
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
          child: Button.primary(key: UniqueKey(), label: "Invoice",
            onTap: (set)async {
              set.setBusy(true).setDisabled(true);
              await controller.store();
              set.setBusy(false).setDisabled(false);
            },
          ),
        )
        // InkWell(
        //   child: Container(
        //     alignment: Alignment.center,
        //     margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcButton),
        //     child: Row(
        //       children: [
        //         Icon(
        //           Icons.arrow_downward_sharp,
        //           color: kcWhite,
        //           size: 16,
        //         ),
        //         Text(
        //           'Invoice',
        //           style: TextStyl.bodySm?.copyWith(color: kcWhite, fontSize: 14, fontWeight: FontWeight.w600),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Container(
                        width: screen.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
                          BoxShadow(
                            color: kcDarkAlt.withOpacity(0.3),
                            blurRadius: 2,
                          )
                        ]),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  height: 120,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: kcDarkAlt.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                        image: AssetImage("assets/placeholders/hotel-placeholder.png"),
                                        fit: BoxFit.contain
                                        ,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ...List.generate(4, (index) {
                                            return Icon(
                                              Icons.star,
                                              color: kcWarning.withOpacity(0.8),
                                              size: 14,
                                            );
                                          }),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Hotel",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(color: kcDarkAlt, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Hotel Prince Viraj",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: kcBlack, fontSize: 15, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "7873-79 Akanksha",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Road Seoni Barapathar ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: kcGreen,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                            child: Text(
                                              "3.5/5",
                                              style: TextStyl.bodySm?.copyWith(color: kcWhite),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "554 Verified Rating",
                                            style: TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Check in",
                                      style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "Sat, 20 May 2023",
                                      style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "12:00 pm",
                                      style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Check out",
                                      style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "Sat, 22 May 2023",
                                      style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "12:00 pm",
                                      style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1 Room for 2 Adults",
                                  style: TextStyl.bodySm?.copyWith(
                                    fontSize: 16,
                                  )),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: kcPrimary.withOpacity(0.1),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Executive Room",
                                                    style: TextStyl.bodySm
                                                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: kcBlack.withOpacity(0.7))),
                                                SizedBox(height: 10),
                                                Text("2 Aults"),
                                                SizedBox(height: 3),
                                                Text("20 May-22 May, 1 Room", style: TextStyl.bodySm?.copyWith(fontSize: 12, color: kcDarkAlt)),
                                                SizedBox(height: 3),
                                                Text("1 x Deluxe Twin (Gold Plus Air Conditional Room Twin)",
                                                    style: TextStyl.bodySm?.copyWith(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Text("Rooms Only |"),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      "Not Refundable",
                                                      style: TextStyl.bodySm?.copyWith(color: kcDanger),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Payment Summary",
                                  style: TextStyl.bodySm?.copyWith(
                                    fontSize: 16,
                                  )),
                              Divider(),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Room Charges (1 room x 1 night)", style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcBlack)),
                                      SizedBox(height: 3),
                                      Text("Excludes taxes & fees", style: TextStyl.bodySm?.copyWith(fontSize: 12, color: kcDarkAlt)),
                                    ],
                                  ),
                                  Spacer(),
                                  Text("₹ 3000", style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcBlack, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Discount", style: TextStyl.bodySm?.copyWith(fontSize: 14)),
                                    ],
                                  ),
                                  Spacer(),
                                  Text("-₹ 651", style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcGreen, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Amount Payable", style: TextStyl.bodySm?.copyWith(fontSize: 14)),
                                    ],
                                  ),
                                  Spacer(),
                                  Text("₹ 2349", style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcBlack, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Row(
                          children: [
                            Text("Call for more details",
                                style: TextStyl.bodySm?.copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                launch("tel://214324234");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(color: kcButton.withOpacity(0.2), shape: BoxShape.circle),
                                child: Icon(
                                  Icons.call,
                                  color: kcButton,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Guests Details",
                                  style: TextStyl.bodySm?.copyWith(
                                    fontSize: 16,
                                  )),
                              Divider(),
                              SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                      Text(
                                        "Phone",
                                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                      Text(
                                        "Email",
                                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mayank Sarathe",
                                        style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                      Text(
                                        "7489532678",
                                        style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                      Text(
                                        "chetanghogre28@hotmail.com",
                                        style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text("we'll send your booking info on your mobile and email",
                                  style: TextStyl.bodySm?.copyWith(fontSize: 12, color: kcDarkAlt.withOpacity(0.8))),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outlined,
                              color: kcDarkAlt,
                              size: 18,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Do you want to cancel this booking?",
                                style: TextStyl.bodySm?.copyWith(
                                  fontSize: 12,
                                  color: kcDarkAlt,
                                )),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                controller.onChangedTab(2);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(color: kcButton, borderRadius: BorderRadius.circular(5)),
                                child: Text("Cancel",
                                    style: TextStyl.bodySm?.copyWith(
                                      color: kcWhite,
                                      fontSize: 15,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////+++++++++++++++++++++++++
////Tablet
////+++++++++++++++++++++++++
class TabletBookingDetails extends StatelessWidget {
  const TabletBookingDetails({super.key, required this.controller});

  final BookingsController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcBackground,
      titleSpacing: 0,
      title: "Booking Details",
      actions: [
        InkWell(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcButton),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_downward_sharp,
                  color: kcWhite,
                  size: 16,
                ),
                Text(
                  'Invoice',
                  style: TextStyl.bodySm?.copyWith(color: kcWhite, fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        )
      ],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Container(
                        width: screen.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(color: kcWhite, borderRadius: BorderRadius.circular(5), boxShadow: [
                          BoxShadow(
                            color: kcDarkAlt.withOpacity(0.3),
                            blurRadius: 2,
                          )
                        ]),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  height: 120,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: kcDarkAlt.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(5.0),
                                      image: DecorationImage(
                                        image: AssetImage("assets/placeholders/hotel-placeholder.png"),
                                        fit: BoxFit.contain,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ...List.generate(4, (index) {
                                            return Icon(
                                              Icons.star,
                                              color: kcWarning.withOpacity(0.8),
                                              size: 14,
                                            );
                                          }),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Hotel",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(color: kcDarkAlt, fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Hotel Prince Viraj",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: kcBlack, fontSize: 15, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "7873-79 Akanksha",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Road Seoni Barapathar ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: kcGreen,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                            child: Text(
                                              "3.5/5",
                                              style: TextStyl.bodySm?.copyWith(color: kcWhite),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "554 Verified Rating",
                                            style: TextStyl.bodySm?.copyWith(color: kcDarkAlt),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Check in",
                                      style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "Sat, 20 May 2023",
                                      style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "12:00 pm",
                                      style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Check out",
                                      style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "Sat, 22 May 2023",
                                      style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "12:00 pm",
                                      style: TextStyle(color: kcDarkAlt, fontSize: 13),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1 Room for 2 Adults",
                                  style: TextStyl.bodySm?.copyWith(
                                    fontSize: 16,
                                  )),
                              SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: kcPrimary.withOpacity(0.1),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Executive Room",
                                                    style: TextStyl.bodySm
                                                        ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: kcBlack.withOpacity(0.7))),
                                                SizedBox(height: 10),
                                                Text("2 Aults"),
                                                SizedBox(height: 3),
                                                Text("20 May-22 May, 1 Room", style: TextStyl.bodySm?.copyWith(fontSize: 12, color: kcDarkAlt)),
                                                SizedBox(height: 3),
                                                Text("1 x Deluxe Twin (Gold Plus Air Conditional Room Twin)",
                                                    style: TextStyl.bodySm?.copyWith(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Text("Rooms Only |"),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      "Not Refundable",
                                                      style: TextStyl.bodySm?.copyWith(color: kcDanger),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Payment Summary",
                                  style: TextStyl.bodySm?.copyWith(
                                    fontSize: 16,
                                  )),
                              Divider(),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Room Charges (1 room x 1 night)", style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcBlack)),
                                      SizedBox(height: 3),
                                      Text("Excludes taxes & fees", style: TextStyl.bodySm?.copyWith(fontSize: 12, color: kcDarkAlt)),
                                    ],
                                  ),
                                  Spacer(),
                                  Text("₹ 3000", style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcBlack, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Discount", style: TextStyl.bodySm?.copyWith(fontSize: 14)),
                                    ],
                                  ),
                                  Spacer(),
                                  Text("-₹ 651", style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcGreen, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Amount Payable", style: TextStyl.bodySm?.copyWith(fontSize: 14)),
                                    ],
                                  ),
                                  Spacer(),
                                  Text("₹ 2349", style: TextStyl.bodySm?.copyWith(fontSize: 14, color: kcBlack, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Row(
                          children: [
                            Text("Call for more details",
                                style: TextStyl.bodySm?.copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                launch("tel://214324234");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(color: kcButton.withOpacity(0.2), shape: BoxShape.circle),
                                child: Icon(
                                  Icons.call,
                                  color: kcButton,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Guests Details",
                                  style: TextStyl.bodySm?.copyWith(
                                    fontSize: 16,
                                  )),
                              Divider(),
                              SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                      Text(
                                        "Phone",
                                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                      Text(
                                        "Email",
                                        style: TextStyl.bodySm?.copyWith(color: kcDarkAlt, fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mayank Sarathe",
                                        style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                      Text(
                                        "7489532678",
                                        style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                      Text(
                                        "chetanghogre28@hotmail.com",
                                        style: TextStyl.bodySm?.copyWith(color: kcBlack.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text("we'll send your booking info on your mobile and email",
                                  style: TextStyl.bodySm?.copyWith(fontSize: 12, color: kcDarkAlt.withOpacity(0.8))),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        width: screen.width,
                        decoration: BoxDecoration(
                          color: kcWhite,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outlined,
                              color: kcDarkAlt,
                              size: 18,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Do you want to cancel this booking?",
                                style: TextStyl.bodySm?.copyWith(
                                  fontSize: 12,
                                  color: kcDarkAlt,
                                )),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                controller.onChangedTab(2);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(color: kcButton, borderRadius: BorderRadius.circular(5)),
                                child: Text("Cancel",
                                    style: TextStyl.bodySm?.copyWith(
                                      color: kcWhite,
                                      fontSize: 15,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
