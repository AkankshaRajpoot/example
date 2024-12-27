import 'package:get/get.dart';

import '../../../models/ApiResponse.dart';
import 'ApiNotificationService.dart';
import 'MockNotificationService.dart';

abstract class NotificationService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = false;

  /// Create and get the instance of [NotificationService]
  static NotificationService get instance {
    if (!Get.isRegistered<NotificationService>())
      Get.lazyPut<NotificationService>(() => MOCK_ENABLED ? MockNotificationService() : ApiNotificationService());
    return Get.find<NotificationService>();
  }

  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  Future<ApiResponse> index();
}
