import 'package:get/get.dart';
import '../HotelModule.dart';

List<GetPage> hotelRoutes = [
  GetPage(name: '/hotel', page: () => HotelPage()),
  GetPage(name: '/hotelShow', page: () => HotelShowPage()),
  GetPage(name: '/selectRoom', page: () => SelectRoomPage()),
  GetPage(name: '/review', page: () => ReviewPage()),
  GetPage(name: '/askQnA', page: () => AskQnAWidget()),
  GetPage(name: '/thankYou', page: () => ThankyouPage()),
];

