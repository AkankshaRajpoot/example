import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vishrampoint/app/modules/Coupons/views/widget/CouponsWidget.dart';

import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/layouts/ResponsiveUi.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../controllers/CouponsController.dart';

class CouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponsController>(
      init: CouponsController(),
      builder: (CouponsController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
            ? LoadingIconWidget(message: "Please wait...")
            : ResponsiveUi(
          mobile: MobileCoupons(),
          tablet: TabletCoupons(),
        );
      },
    );
  }
}

////+++++++++++++++++++++++++
////Mobile
////+++++++++++++++++++++++++
class MobileCoupons extends StatelessWidget {
  const MobileCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: "Coupons",
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ...List.generate(5, (index) {
                    return CouponsWidget();
                  })
                ],
              ),
            ),
          )),
    );
  }
}

////+++++++++++++++++++++++++
////Tablet
////+++++++++++++++++++++++++
class TabletCoupons extends StatelessWidget {
  const TabletCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: "Coupons",
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ...List.generate(5, (index) {
                    return CouponsWidget();
                  })
                ],
              ),
            ),
          )),
    );
  }
}
