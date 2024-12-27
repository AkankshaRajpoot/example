import '../../../models/ApiResponse.dart';
import '../../../helpers/Request.dart';
import 'HomeService.dart';

class ApiHomeService implements HomeService {
  /// Start the server request
  @override
  void init() => Request.start();

  /// Stop the server request
  @override
  void close() => Request.close();

  @override
  Future<ApiResponse> getHomeSlider() async {
    return await Request.get('/home-slider', authenticate: true);
  }
  Future<ApiResponse> index() async {
    return await Request.get('/home', authenticate: true);
  }
}

