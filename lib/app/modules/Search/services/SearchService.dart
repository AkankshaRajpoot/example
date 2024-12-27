import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiSearchService.dart';
import 'MockSearchService.dart';

abstract class SearchService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [SearchService]
  static SearchService get instance {
    if (!Get.isRegistered<SearchService>()) Get.lazyPut<SearchService>(() => MOCK_ENABLED ? MockSearchService() : ApiSearchService());
    return Get.find<SearchService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  /// Do Something
  Future<ApiResponse> doSomething();
}

