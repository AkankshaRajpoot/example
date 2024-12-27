import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';
import 'package:vishrampoint/app/modules/Notification/views/widget/NotificationsWidget.dart';
import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../../../shared/views/widgets/NoDataWidget.dart';
import '../controllers/NotificationController.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (NotificationController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
            ? LoadingIconWidget(message: "Please wait...")
            :  ResponsiveUi(
          mobile: MobileNotification(
            controller: controller,
          ),
          tablet: TabletNotification(
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
class MobileNotification extends StatelessWidget {
  const MobileNotification({super.key, required this.controller});
  final NotificationController controller;
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcWhite,
      title: "Notifications",
      titleSpacing: 0,
      actions: [],
      body: RefreshIndicator(
        onRefresh: () => controller.index(),
        child: Obx(
              () => controller.notificationList.isNotEmpty
              ? Center(
              child: NoDataWidget(
                message: "Notification Data Not Found!",
              ))
              : SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NotificationsWidget(active: true),
                NotificationsWidget(active: false),
                NotificationsWidget(active: true),
                NotificationsWidget(active: true),
                NotificationsWidget(active: false),
                NotificationsWidget(active: true),
                NotificationsWidget(active: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


///+++++++++++++++++++++++++
///Tablet
///+++++++++++++++++++++++++
class TabletNotification extends StatelessWidget {
  const TabletNotification({super.key, required this.controller});
  final NotificationController controller;
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      backgroundColor: kcWhite,
      title: "Notifications",
      titleSpacing: 0,
      actions: [],
      body: RefreshIndicator(
        onRefresh: () => controller.index(),
        child: Obx(
              () => controller.notificationList.isNotEmpty
              ? Center(
              child: NoDataWidget(
                message: "Notification Data Not Found!",
              ))
              : SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NotificationsWidget(active: true),
                NotificationsWidget(active: false),
                NotificationsWidget(active: true),
                NotificationsWidget(active: true),
                NotificationsWidget(active: false),
                NotificationsWidget(active: true),
                NotificationsWidget(active: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
