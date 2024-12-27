import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'ApiFavouritesService.dart';
import 'MockFavouritesService.dart';

abstract class FavouritesService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [FavouritesService]
  static FavouritesService get instance {
    if (!Get.isRegistered<FavouritesService>()) Get.lazyPut<FavouritesService>(() => MOCK_ENABLED ? MockFavouritesService() : ApiFavouritesService());
    return Get.find<FavouritesService>();
  }
  
  /// Start the server request
  void init();

  /// Stop the server request
  void close();

  /// Do Something
  Future<ApiResponse> getFavourite();
}

