import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';

import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../controllers/WebviewController.dart';

class WebviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebviewController>(
      init: WebviewController(),
      builder: (WebviewController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
                ? LoadingIconWidget(message: "Please wait...")
                : MasterLayout(
                    title: "${controller.pageTitle}",
                    body: Obx(
                      () => WebView(
                        initialUrl: controller.url,
                        javascriptMode: JavascriptMode.unrestricted,
                      ),
                    ),
                  );
      },
    );
  }
}
