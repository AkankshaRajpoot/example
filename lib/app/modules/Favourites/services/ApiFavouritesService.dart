import '../../../models/ApiResponse.dart';
import '../../../helpers/Request.dart';
import 'FavouritesService.dart';

class ApiFavouritesService implements FavouritesService {
  /// Start the server request
  @override
  void init() => Request.start();

  /// Stop the server request
  @override
  void close() => Request.close();
  
  @override
  Future<ApiResponse> getFavourite() async {
    return await Request.get('/favourite', authenticate: true);
  }
}

