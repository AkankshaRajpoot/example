import 'package:get/get.dart';

import '../AuthModule.dart';

List<GetPage> authRoutes = [
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/verify-otp', page: () => VerifyOtpPage()),
];
