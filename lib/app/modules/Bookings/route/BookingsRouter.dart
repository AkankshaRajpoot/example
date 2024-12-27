import 'package:get/get.dart';

import '../BookingsModule.dart';
import '../views/BookingDetailsPage.dart';

List<GetPage> bookingsRoutes = [
  GetPage(name: '/bookings', page: () => BookingsPage()),
  GetPage(name: '/bookingDetails', page: () => BookingDetailsPage()),
];

