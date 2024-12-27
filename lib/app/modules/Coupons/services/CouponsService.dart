import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiCouponsService.dart';
import 'MockCouponsService.dart';

abstract class CouponsService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [CouponsService]
  static CouponsService get instance {
    if (!Get.isRegistered<CouponsService>()) Get.lazyPut<CouponsService>(() => MOCK_ENABLED ? MockCouponsService() : ApiCouponsService());
    return Get.find<CouponsService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  /// Do Something
  Future<ApiResponse> doSomething();
}

