import '../../../models/ApiResponse.dart';
import 'ProfileService.dart';

class MockProfileService implements ProfileService {
  /// Start the server request
  @override
  void init() => null;

  /// Stop the server request
  @override
  void close() => null;
  
  @override
  Future<ApiResponse> doSomething() async {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}

