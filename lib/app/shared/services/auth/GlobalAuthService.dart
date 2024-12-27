import 'package:get/get.dart';

import '../../../models/ApiResponse.dart';
import 'ApiGlobalAuthService.dart';
import 'MockGlobalAuthService.dart';

abstract class GlobalAuthService {
  /// Configure if Mock is enabled or not
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [GlobalAuthService]
  static GlobalAuthService get instance {
    if (!Get.isRegistered<GlobalAuthService>())
      Get.lazyPut<GlobalAuthService>(
        () => MOCK_ENABLED ? MockGlobalAuthService() : ApiGlobalAuthService(),
      );
    return Get.find<GlobalAuthService>();
  }

  /// Get and refresh user data
  Future<ApiResponse> getUser();

  /// Logout the user from system
  Future<ApiResponse> logout();
}
