import 'package:get/get_navigation/src/routes/get_route.dart';
import '../app/modules/Coupons/route/CouponsRouter.dart';
import '../app/modules/Modules.dart';
import '../app/modules/Referral/route/ReferralRouter.dart';
import '../app/modules/Search/route/SearchRouter.dart';

List<GetPage> routes = [
  /// Basic Routes
  ...splashRoutes,

  /// Auth Routes
  ...authRoutes,
  /// Setting Page Route
  ...settingRoutes,


  /// Notification Routes
  ...notificationRoutes,


  /// Home Routes
  ...homeRoutes,

  /// Hotel Routes
  ...hotelRoutes,


  /// Bookings Routes
  ...bookingsRoutes,

  /// Favourites Routes
  ...favouritesRoutes,

  /// Profile Routes
  ...profileRoutes,

  /// Search Routes
  ...searchRoutes,

  /// Referral Routes
  ...referralRoutes,

  /// Coupons Routes
  ...couponsRoutes,
];
