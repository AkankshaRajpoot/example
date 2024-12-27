import 'package:get/get.dart';

import '../../../../data/HotelData.dart';
import '../../../models/ApiResponse.dart';
import 'HotelService.dart';

class MockHotelService implements HotelService {
  /// Start the server request
  @override
  void init() => null;

  /// Stop the server request
  @override
  void close() => null;
  
  @override
  Future<ApiResponse> index() async {
    return await 300.milliseconds.delay(() => Hotel.hotel);
  }
  Future<ApiResponse> getHotelShow() async {
    return await 300.milliseconds.delay(() => Hotel.hotelShow);
  }
}

