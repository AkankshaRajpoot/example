import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiReferralService.dart';
import 'MockReferralService.dart';

abstract class ReferralService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [ReferralService]
  static ReferralService get instance {
    if (!Get.isRegistered<ReferralService>()) Get.lazyPut<ReferralService>(() => MOCK_ENABLED ? MockReferralService() : ApiReferralService());
    return Get.find<ReferralService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  /// Do Something
  Future<ApiResponse> doSomething();
}

