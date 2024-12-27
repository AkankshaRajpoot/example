/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vishrampoint/app/modules/Modules.dart';
import 'package:vishrampoint/app/modules/Profile/views/widget/AccountSettingWidget.dart';
import '../../../helpers/Global.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../../Coupons/route/CouponsRoutes.dart';
import '../../Referral/route/ReferralRoutes.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
                ? LoadingIconWidget(message: "Please wait...")
                : ResponsiveUi(
                    mobile: MobileProfile(
                      controller: controller,
                    ),
                    tablet: TabletProfile(
                      controller: controller,
                    ),
                  );
      },
    );
  }
}

///+++++++++++++++++++++++++
///Mobile
///+++++++++++++++++++++++++
class MobileProfile extends StatelessWidget {
  const MobileProfile({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcBackground,
      title: "Profile",
      titleSpacing: 0,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(ProfileRoutes.editProfile);
                },
                child: Container(
                  width: screen.width,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      color: kcWhite,
                      //  borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.3),
                          blurRadius: 2,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Stack(alignment: Alignment.bottomRight, children: [
                      //
                      Container(
                        decoration: BoxDecoration(
                          color: kcInfo.withOpacity(0.2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            // image: controller.image.path == '' ? NetworkImage('${auth.user.avatar}') as ImageProvider : FileImage(controller.image),
                            image: controller.image.path == ''
                                ? AssetImage(
                                        'assets/placeholders/user-male.png')
                                    as ImageProvider
                                : FileImage(controller.image),
                            fit: BoxFit.contain,
                          ),
                        ),
                        height: 110,
                        width: 110,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Vartika Kesharwani",
                        style: TextStyl.bodySm?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kcBlack.withOpacity(0.8)),
                      ),
                      Text(
                        "7483838738",
                        style: TextStyl.bodySm
                            ?.copyWith(color: kcBlack, fontSize: 12),
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           "Vartika Kesharwani",
                      //           style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                      //         ),
                      //         Text(
                      //           "7483838738",
                      //           style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 12),
                      //         ),
                      //       ],
                      //     ),
                      //     Spacer(),
                      //     Icon(Icons.edit)
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.all(Radius.circular(10)),
                      //   child: LinearProgressIndicator(
                      //     minHeight: 8,
                      //     backgroundColor: kcGray.withOpacity(0.5),
                      //     valueColor: AlwaysStoppedAnimation<Color>(
                      //       kcButton,
                      //     ),
                      //     value: 0.4,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Your profile is 25% complete",
                      //       style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 12),
                      //     ),
                      //     Spacer(),
                      //     Text(
                      //       "Add Email",
                      //       style: TextStyl.bodySm?.copyWith(color: kcInfo, fontSize: 12),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: screen.width,
                decoration: BoxDecoration(
                  color: kcWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Account",
                      style: TextStyl.bodySm?.copyWith(
                          color: kcBlack.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(ProfileRoutes.editProfile);
                      },
                      title: "Profile Settings",
                      // description: "Edit your profile",
                      image: "assets/icons/profile-user.png",
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(SettingRoutes.setting);
                      },
                      title: "Settings",
                      // description: "Push notification, go contacts",
                      image: "assets/icons/setting.png",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: screen.width,
                decoration: BoxDecoration(
                  color: kcWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Referrals",
                      style: TextStyl.bodySm?.copyWith(
                          color: kcBlack.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(ReferralRoutes.referral);
                      },
                      title: "Refer & Earn",
                      //   description: "Refer vishramPoint to friends & earn goCash",
                      image: "assets/icons/refer.png",
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(CouponsRoutes.coupons);
                      },
                      title: "My Coupons",
                      // description: "Your gpPasses, coupons & vouchers here",
                      image: "assets/icons/coupon.png",
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        auth.logout();
                      },
                      title: "Logout",
                      image: "assets/icons/logout.png",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  launch("https://play.google.com/");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[kcLightPink, kcWhite, kcWhite, kcWhite],
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.3),
                          blurRadius: 2,
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rate our App",
                              style: TextStyl.bodySm?.copyWith(
                                  color: kcBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "We love appreciation & feedbacks",
                              style: TextStyl.bodySm?.copyWith(
                                  color: kcBlack.withOpacity(0.8),
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: kcInfoDark,
                        ),
                      )
                    ],
                  ),
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
class TabletProfile extends StatelessWidget {
  const TabletProfile({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcBackground,
      title: "Profile",
      titleSpacing: 0,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(ProfileRoutes.editProfile);
                },
                child: Container(
                  width: screen.width,
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      color: kcWhite,
                      //  borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.3),
                          blurRadius: 2,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Stack(alignment: Alignment.bottomRight, children: [
                      //
                      Container(
                        decoration: BoxDecoration(
                          color: kcInfo.withOpacity(0.2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            // image: controller.image.path == '' ? NetworkImage('${auth.user.avatar}') as ImageProvider : FileImage(controller.image),
                            image: controller.image.path == ''
                                ? AssetImage(
                                        'assets/placeholders/user-male.png')
                                    as ImageProvider
                                : FileImage(controller.image),
                            fit: BoxFit.contain,
                          ),
                        ),
                        height: 110,
                        width: 110,
                      ),
                      //   GestureDetector(
                      //     onTap: () {
                      //       //controller.getImage();
                      //     },
                      //     child: Container(
                      //       padding: const EdgeInsets.all(5.0),
                      //       height: 25,
                      //       width: 25,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(15),
                      //         color: kcInfo,
                      //         border: Border.all(
                      //           color: kcWhite,
                      //           width: 1.5,
                      //         ),
                      //       ),
                      //       child: SvgPicture.asset(
                      //         'assets/icons/camera.svg',
                      //         color: kcWhite,
                      //       ),
                      //     ),
                      //   ),
                      // ]),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Vartika Kesharwani",
                        style: TextStyl.bodySm?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kcBlack.withOpacity(0.8)),
                      ),
                      Text(
                        "7483838738",
                        style: TextStyl.bodySm
                            ?.copyWith(color: kcBlack, fontSize: 12),
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           "Vartika Kesharwani",
                      //           style: TextStyl.bodySm?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                      //         ),
                      //         Text(
                      //           "7483838738",
                      //           style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 12),
                      //         ),
                      //       ],
                      //     ),
                      //     Spacer(),
                      //     Icon(Icons.edit)
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.all(Radius.circular(10)),
                      //   child: LinearProgressIndicator(
                      //     minHeight: 8,
                      //     backgroundColor: kcGray.withOpacity(0.5),
                      //     valueColor: AlwaysStoppedAnimation<Color>(
                      //       kcButton,
                      //     ),
                      //     value: 0.4,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Your profile is 25% complete",
                      //       style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 12),
                      //     ),
                      //     Spacer(),
                      //     Text(
                      //       "Add Email",
                      //       style: TextStyl.bodySm?.copyWith(color: kcInfo, fontSize: 12),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: screen.width,
                decoration: BoxDecoration(
                  color: kcWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Account",
                      style: TextStyl.bodySm?.copyWith(
                          color: kcBlack.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(ProfileRoutes.editProfile);
                      },
                      title: "Profile Settings",
                      // description: "Edit your profile",
                      image: "assets/icons/profile-user.png",
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(SettingRoutes.setting);
                      },
                      title: "Settings",
                      // description: "Push notification, go contacts",
                      image: "assets/icons/setting.png",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: screen.width,
                decoration: BoxDecoration(
                  color: kcWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Referrals",
                      style: TextStyl.bodySm?.copyWith(
                          color: kcBlack.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(ReferralRoutes.referral);
                      },
                      title: "Refer & Earn",
                      // description: "Refer vishramPoint to friends & earn goCash",
                      image: "assets/icons/refer.png",
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(CouponsRoutes.coupons);
                      },
                      title: "My Coupons",
                      // description: "Your gpPasses, coupons & vouchers here",
                      image: "assets/icons/coupon.png",
                    ),
                    AccountSettingWidget(
                      onTap: () {
                        Get.toNamed(AuthRoutes.login);
                      },
                      title: "Logout",
                      // description: "Sign Out your profile",
                      image: "assets/icons/logout.png",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  launch("https://play.google.com/");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[kcLightPink, kcWhite, kcWhite, kcWhite],
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: kcDarkAlt.withOpacity(0.3),
                          blurRadius: 2,
                        )
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rate our App",
                              style: TextStyl.bodySm?.copyWith(
                                  color: kcBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "We love appreciation & feedbacks",
                              style: TextStyl.bodySm?.copyWith(
                                  color: kcBlack.withOpacity(0.8),
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: kcInfoDark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
