import 'package:get/get.dart';

import '../../../../data/FavouritesData.dart';
import '../../../models/ApiResponse.dart';
import 'FavouritesService.dart';

class MockFavouritesService implements FavouritesService {
  /// Start the server request
  @override
  void init() => null;

  /// Stop the server request
  @override
  void close() => null;
  
  @override
  Future<ApiResponse> getFavourite() async {
    return await 300.milliseconds.delay(() => Favourites.favourite);
  }
}

