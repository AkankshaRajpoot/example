/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/


import 'package:get/get.dart';

import '../../../shared/controllers/AppController.dart';
import '../services/WebviewService.dart';

class WebviewController extends AppController {
  /// Create and get the instance of the controller
  static WebviewController get instance {
    if (!Get.isRegistered<WebviewController>()) Get.put(WebviewController());
    return Get.find<WebviewController>();
  }

  /// Initialise [WebviewModule] service
  final WebviewService _webviewService = WebviewService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  var _pageTitle = "Webview".obs;
  String get pageTitle => _pageTitle.value;
  var _url = ''.obs;
  String get url => _url.value;

  /// --- Functionality Handlers ---
  /// Observables & Getters

  // Add Scoped Var Here...


  @override
  void onInit() {
    super.onInit();
    _url(Get.parameters['url']);
    _pageTitle(Get.parameters['page']);
  }

}

