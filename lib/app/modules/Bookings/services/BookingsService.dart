import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiBookingsService.dart';
import 'MockBookingsService.dart';

abstract class BookingsService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [BookingsService]
  static BookingsService get instance {
    if (!Get.isRegistered<BookingsService>()) Get.lazyPut<BookingsService>(() => MOCK_ENABLED ? MockBookingsService() : ApiBookingsService());
    return Get.find<BookingsService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  /// Do Something
  Future<ApiResponse> doSomething();
}

