import 'package:get/get.dart';

import '../../../../data/HomeData.dart';
import '../../../models/ApiResponse.dart';
import 'HomeService.dart';

class MockHomeService implements HomeService {
  /// Start the server request
  @override
  void init() => null;

  /// Stop the server request
  @override
  void close() => null;

  @override
  Future<ApiResponse> getHomeSlider() async {
    return await 300.milliseconds.delay(() => HomeData.home);
  }
  Future<ApiResponse> index() async {
    return await 300.milliseconds.delay(() => HomeData.homeData);
  }
}

