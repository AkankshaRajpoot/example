import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';
import '../../../helpers/Global.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../controllers/ReferralController.dart';

class ReferralPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReferralController>(
      init: ReferralController(),
      builder: (ReferralController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
            ? LoadingIconWidget()
            : ResponsiveUi(
          mobile: MobileReferral(
            controller: controller,
          ),
          tablet: TabletReferral(
            controller: controller,
          ),
        );
      },
    );
  }
}
////+++++++++++++++++++++++++
////Mobile
////+++++++++++++++++++++++++
class MobileReferral extends StatelessWidget {
  const MobileReferral({super.key, required this.controller});

  final ReferralController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      titleSpacing: 0,
      title: "Referral",
      backgroundColor: kcWhite,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://paytmblogcdn.paytm.com/wp-content/uploads/2021/12/25_Refer_Win_Paytms-Refer-_-Earn-Refer-a-friend-and-earn-guaranteed-cashback-800x500.jpg',
                        height: screen.height * 0.3,
                        width: screen.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Refer & Earn',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Spacer(),
                              Icon(
                                Icons.share,
                                color: kcInfo,
                                size: 25,
                              )
                            ],
                          ),

                          // Text("Refer this app to your friends and family and earn money through it and receive many more coupons",
                          //     textAlign: TextAlign.center),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                controller.Copy(context, controller.text);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(color: kcOffWhite, borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Referal Code',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: kcDarkAlt),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "ghshxb",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Obx(
                                          () => Text(
                                        !controller.isTap ? "Tap to Copy" : "Copied",
                                        style: TextStyle(color: kcPrimary, fontSize: 14, fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Button.block(
                key: UniqueKey(),
                flat: true,
                // variant: ButtonVariant.WHITE,
                label: "Share",
                onTap: (btn) async {
                  controller.onShare();
                },
              )
            ],
          )),
    );
  }
}
////+++++++++++++++++++++++++
////Tablet
////+++++++++++++++++++++++++
class TabletReferral extends StatelessWidget {
  const TabletReferral({super.key, required this.controller});

  final ReferralController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      titleSpacing: 0,
      title: "Referral",
      backgroundColor: kcWhite,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://paytmblogcdn.paytm.com/wp-content/uploads/2021/12/25_Refer_Win_Paytms-Refer-_-Earn-Refer-a-friend-and-earn-guaranteed-cashback-800x500.jpg',
                        height: screen.height * 0.3,
                        width: screen.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Refer & Earn',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Spacer(),
                              Icon(
                                Icons.share,
                                color: kcInfo,
                                size: 25,
                              )
                            ],
                          ),

                          // Text("Refer this app to your friends and family and earn money through it and receive many more coupons",
                          //     textAlign: TextAlign.center),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                controller.Copy(context, controller.text);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(color: kcOffWhite, borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Referal Code',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: kcDarkAlt),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "ghshxb",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Obx(
                                          () => Text(
                                        !controller.isTap ? "Tap to Copy" : "Copied",
                                        style: TextStyle(color: kcPrimary, fontSize: 14, fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Button.block(
                key: UniqueKey(),
                flat: true,
                // variant: ButtonVariant.WHITE,
                label: "Share",
                onTap: (btn) async {
                  controller.onShare();
                },
              )
            ],
          )),
    );
  }
}
