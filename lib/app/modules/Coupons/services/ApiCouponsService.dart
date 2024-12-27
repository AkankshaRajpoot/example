import '../../../models/ApiResponse.dart';
import '../../../helpers/Request.dart';
import 'CouponsService.dart';

class ApiCouponsService implements CouponsService {
  /// Start the server request
  @override
  void init() => Request.start();

  /// Stop the server request
  @override
  void close() => Request.close();
  
  @override
  Future<ApiResponse> doSomething() async {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}

