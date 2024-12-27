import '../../../helpers/Request.dart';
import '../../../models/ApiResponse.dart';
import 'GlobalAuthService.dart';

class ApiGlobalAuthService implements GlobalAuthService {
  @override
  Future<ApiResponse> getUser() async {
    return await Request.get('/profile', authenticate: true);
  }

  @override
  Future<ApiResponse> logout() async {
    return await Request.get('/logout', authenticate: true);
  }
}
