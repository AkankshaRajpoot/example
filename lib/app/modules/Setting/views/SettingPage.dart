import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/helpers/ColorPalette.dart';
import 'package:ui_x/helpers/TextStyl.dart';
import 'package:ui_x/widgets/buttons/Button.dart';
import 'package:vishrampoint/app/modules/Setting/views/widget/SettingPageWidget.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../controllers/SettingController.dart';
import '../route/SettingRoutes.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (SettingController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
                ? LoadingIconWidget(message: "Please wait...")
                : MasterLayout(
                    title: "Settings",
                    backgroundColor: kcWhite,
                    body: SafeArea(
                      minimum: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            SettingPageWidget(
                              title: 'Account Deletion',
                              subTitle: 'Manage your password and 2-step verification preferences',
                              onTap: () =>   Get.bottomSheet(
                                RequestDeleteWidget(controller: controller),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
      },
    );
  }
}

class RequestDeleteWidget extends StatelessWidget {
  const RequestDeleteWidget({Key? key, required this.controller}) : super(key: key);

  final SettingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Center(
          //   child: Image.asset(
          //     "assets/icons/minus-horizontal-straight-line.png",
          //     width: 65,
          //     height: 45,
          //   ),
          // ),
          Text(
            "Sorry to see you are going :(",
            style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                    () => Checkbox(
                    value: controller.checkDelete,
                    onChanged: (value) {
                      controller.onCheck(value!);
                    }),
              ),
              Expanded(
                child: Text(
                  "It is important to note that deleting your account permanently is often an irreversible action. Once you delete your account, you will not be able to recover it, and any data or content associated with the account will be permanently lost.",
                  style: TextStyl.bodySm?.copyWith(color: kcBlack, fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
                () => controller.checkDelete
                ? Button.block(
              onTap: (set) {
                set.setBusy(true).setDisabled(true);
                // controller.deleteAccount();
                set.setBusy(false).setDisabled(false);
              },
              key: UniqueKey(),
              variant: ButtonVariant.DANGER,
              label: "I Understand, Request Deletion",
            )
                : Button.block(
              onTap: (set) {
                set.setBusy(true).setDisabled(true);
                set.setBusy(false).setDisabled(false);
              },
              key: UniqueKey(),
              variant: ButtonVariant.LIGHT,
              label: "I Understand, Request Deletion",
            ),
          )
        ],
      ),
    );
  }
}
