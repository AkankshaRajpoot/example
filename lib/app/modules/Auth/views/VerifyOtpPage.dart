import 'package:flutter/material.dart';
import 'package:flutter_countr/Countr.dart';
import 'package:flutter_countr/CountrDuration.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:ui_x/ui_x.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../controllers/VerifyOtpController.dart';
import '../routes/AuthRoutes.dart';

class VerifyOtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = Get.size;
    return GetBuilder<VerifyOtpController>(
        init: VerifyOtpController(),
        builder: (VerifyOtpController controller) {
          return ResponsiveUi(
            mobile: MobileVerifyOtp(
              controller: controller,
            ),
            tablet: TabletVerifyOtp(controller: controller),
          );
        });
  }
}

///Mobile
class MobileVerifyOtp extends StatelessWidget {
  const MobileVerifyOtp({Key? key, required this.controller}) : super(key: key);
  final VerifyOtpController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: '',
      backgroundColor: kcWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => Keyboard.hide(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 180, horizontal: 50),
              alignment: Alignment.center,
              color: Colors.transparent,
              width: double.infinity,
              //height: screen.height * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                        color: kcBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We have sent a verification code to",
                    style: TextStyle(color: kcBlack, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+91-7489532678",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(
                          onTap: () {
                            Get.toNamed(AuthRoutes.login);
                          },
                          child: Text(
                            "Change number",
                            style: TextStyle(color: kcPrimary),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: PinFieldAutoFill(
                      keyboardType: TextInputType.number,
                      autoFocus: true,
                      controller: controller.otpInput,
                      currentCode: controller.otp,
                      codeLength: 4,
                      decoration: UnderlineDecoration(
                          colorBuilder: FixedColorBuilder(kcDarkAlt),
                          gapSpace: 20,
                          textStyle: TextStyle(
                              color: kcDarkAlt, fontSize: 35, height: -0.0010)),
                      onCodeSubmitted: (code) {
                        controller.store(refresh: true);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => controller.timeUp == true
                        ? Row(
                            children: [
                              Spacer(),
                              Text(
                                'RESENDING CODE IN',
                                style: TextStyl.subtitle!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Countr(
                                  controller: controller.countrController!,
                                  onTimerComplete: () {
                                    controller.setTimeUp();
                                  },
                                  builder: (BuildContext context,
                                      CountrDuration remainingTime) {
                                    return Container(
                                      child: Text(
                                        "${remainingTime.minutes}:${remainingTime.seconds}",
                                        style: TextStyl.bodySm?.copyWith(
                                            color: kcBlack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  })
                            ],
                          )
                        : Row(
                            children: [
                              Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  //controller.resentTime();
                                  controller.setStartTimeUp();
                                },
                                child: Text(
                                  'Resend Code',
                                  style: TextStyl.bodySm,
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 120),
                  Button.block(
                    key: UniqueKey(),
                    label: "Verify OTP",
                    variant: ButtonVariant.DANGER,
                    onTap: (btn) async {
                      btn.setBusy(true).setDisabled(true);
                      await controller.store(refresh: true);
                      btn.setBusy(false).setDisabled(false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///Tablet
class TabletVerifyOtp extends StatelessWidget {
  const TabletVerifyOtp({Key? key, required this.controller}) : super(key: key);
  final VerifyOtpController controller;

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: '',
      backgroundColor: kcWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => Keyboard.hide(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 180, horizontal: 50),
              alignment: Alignment.center,
              color: Colors.transparent,
              width: double.infinity,
              //height: screen.height * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                        color: kcBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We have sent a verification code to",
                    style: TextStyle(color: kcBlack, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+91-7489532678",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(
                          onTap: () {
                            Get.toNamed(AuthRoutes.login);
                          },
                          child: Text(
                            "Change number",
                            style: TextStyle(color: kcPrimary),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: PinFieldAutoFill(
                      currentCode: controller.otp,
                      codeLength: 4,
                      decoration: UnderlineDecoration(
                          colorBuilder: FixedColorBuilder(kcDarkAlt),
                          gapSpace: 20,
                          textStyle: TextStyle(
                              color: kcDarkAlt, fontSize: 35, height: -0.0010)),
                      onCodeSubmitted: (code) {},
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => controller.timeUp == true
                        ? Row(
                            children: [
                              Spacer(),
                              Text(
                                'RESENDING CODE IN',
                                style: TextStyl.subtitle!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Countr(
                                  controller: controller.countrController!,
                                  onTimerComplete: () {
                                    controller.setTimeUp();
                                  },
                                  builder: (BuildContext context,
                                      CountrDuration remainingTime) {
                                    return Container(
                                      child: Text(
                                        "${remainingTime.minutes}:${remainingTime.seconds}",
                                        style: TextStyl.bodySm?.copyWith(
                                            color: kcBlack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  })
                            ],
                          )
                        : Row(
                            children: [
                              Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  //controller.resentTime();
                                  controller.setStartTimeUp();
                                },
                                child: Text(
                                  'Resend Code',
                                  style: TextStyl.bodySm,
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 120),
                  Button.block(
                    key: UniqueKey(),
                    label: "Verify OTP",
                    variant: ButtonVariant.DANGER,
                    onTap: (btn) async {
                      btn.setBusy(true).setDisabled(true);
                      await controller.store(refresh: true);
                      btn.setBusy(false).setDisabled(false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
