import 'package:get/get.dart';

import '../../../../../config/Config.dart';
import '../../../../../data/AuthData.dart';
import '../../../../models/ApiResponse.dart';
import 'AuthService.dart';

class MockAuthService implements AuthService {
  /// Create the server request
  @override
  void init() => null;

  /// Close the server request
  @override
  void close() => null;

  // @override
  // Future<ApiResponse> login({required Map<String, dynamic> body}) async {
  //   String _identifier = Config.hasEmail
  //       ? "admin@test.com"
  //       : Config.hasPhone
  //           ? "7489532618"
  //           : 'admin';
  //
  //   return await 300.milliseconds.delay(() {
  //     if (body['identifier'] != _identifier && body['password'] != 'secret') {
  //       return AuthData.loginError;
  //     }
  //
  //     return Config.needsOtpVerification ? AuthData.loginSuccessOtp : AuthData.loginSuccess;
  //   });
  // }

  @override
  Future<ApiResponse> login({required Map<String, dynamic> body}) async {
    String _identifier = "7691926684";

    return await 300.milliseconds.delay(() {
      if (body['identifier'] != _identifier) {
        return AuthData.loginError;
      }

      return Config.needsOtpVerification
          ? AuthData.loginSuccessOtp
          : AuthData.loginSuccess;
    });
  }

  @override
  Future<ApiResponse> google() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> facebook() {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> github() {
    // TODO: implement github
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> register({required Map<String, dynamic> body}) async {
    return await 300.milliseconds.delay(() => AuthData.registerSuccess);
  }

  @override
  Future<ApiResponse> verifyOtp({required Map<String, dynamic> body}) async {
    String _otp = "1234";
    if (body['otp'] != _otp) {
      return AuthData.loginErrorOtp;
    }

    return await 300.milliseconds.delay(() => AuthData.loginSuccess);
  }
}
