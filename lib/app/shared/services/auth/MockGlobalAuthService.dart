import 'package:get/get_utils/get_utils.dart';

import '../../../../data/AuthData.dart';
import '../../../models/ApiResponse.dart';
import 'GlobalAuthService.dart';

class MockGlobalAuthService implements GlobalAuthService {
  @override
  Future<ApiResponse> getUser() async {
    await Future.delayed(2.seconds);
    return AuthData.getUserSuccess;
  }

  @override
  Future<ApiResponse> logout() async {
    return await 2.delay(() => AuthData.logoutSuccess);
  }
}
