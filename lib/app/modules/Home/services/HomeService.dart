import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiHomeService.dart';
import 'MockHomeService.dart';

abstract class HomeService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [HomeService]
  static HomeService get instance {
    if (!Get.isRegistered<HomeService>()) Get.lazyPut<HomeService>(() => MOCK_ENABLED ? MockHomeService() : ApiHomeService());
    return Get.find<HomeService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  /// Do Something
  Future<ApiResponse> getHomeSlider();
  Future<ApiResponse> index();
}

