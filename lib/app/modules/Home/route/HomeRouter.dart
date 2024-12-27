import 'package:get/get.dart';

import '../HomeModule.dart';
import '../views/HourlyPage.dart';

List<GetPage> homeRoutes = [
  GetPage(name: '/home', page: () => HomePage()),
  GetPage(name: '/rooms', page: () => RoomsPage()),
  GetPage(name: '/hourly', page: () => HourlyPage()),
];

