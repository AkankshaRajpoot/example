import '../../../models/ApiResponse.dart';
import '../../../helpers/Request.dart';
import 'WebviewService.dart';

class ApiWebviewService implements WebviewService {
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

