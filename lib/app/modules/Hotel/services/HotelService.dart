import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiHotelService.dart';
import 'MockHotelService.dart';

abstract class HotelService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [HotelService]
  static HotelService get instance {
    if (!Get.isRegistered<HotelService>()) Get.lazyPut<HotelService>(() => MOCK_ENABLED ? MockHotelService() : ApiHotelService());
    return Get.find<HotelService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  Future<ApiResponse> index();
  Future<ApiResponse> getHotelShow();
}

