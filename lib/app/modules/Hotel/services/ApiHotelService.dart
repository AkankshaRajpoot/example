import '../../../models/ApiResponse.dart';
import '../../../helpers/Request.dart';
import 'HotelService.dart';

class ApiHotelService implements HotelService {
  /// Start the server request
  @override
  void init() => Request.start();

  /// Stop the server request
  @override
  void close() => Request.close();
  
  @override
  Future<ApiResponse> index() async {
    return await Request.get('/hotel', authenticate: true);
  }
  Future<ApiResponse> getHotelShow() async {
    return await Request.get('/hotelShow', authenticate: true);
  }
}

