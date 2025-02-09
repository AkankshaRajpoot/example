import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiWebviewService.dart';
import 'MockWebviewService.dart';

abstract class WebviewService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [WebviewService]
  static WebviewService get instance {
    if (!Get.isRegistered<WebviewService>()) Get.lazyPut<WebviewService>(() => MOCK_ENABLED ? MockWebviewService() : ApiWebviewService());
    return Get.find<WebviewService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  /// Do Something
  Future<ApiResponse> doSomething();
}

