import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiProfileService.dart';
import 'MockProfileService.dart';

abstract class ProfileService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [ProfileService]
  static ProfileService get instance {
    if (!Get.isRegistered<ProfileService>()) Get.lazyPut<ProfileService>(() => MOCK_ENABLED ? MockProfileService() : ApiProfileService());
    return Get.find<ProfileService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  /// Do Something
  Future<ApiResponse> doSomething();
}

