/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'package:get/get.dart';
import 'package:vishrampoint/app/modules/Auth/AuthModule.dart';

import '../../../../config/Config.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/controllers/AuthState.dart';

class SplashController extends AppController {
  static SplashController get instance {
    if (!Get.isRegistered<SplashController>()) Get.put(SplashController());
    return Get.find<SplashController>();
  }

  final AuthState auth = AuthState.instance;
  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  // Add Scoped Var Here...

  /// --- Functionality Handlers ---
  /// Observables & Getters

  // Add Scoped Var Here...

  @override
  void onInit() {
    super.onInit();
    redirectUser();
  }
  /// --- Supporting Functionalities Methods ---
  Future<void> redirectUser() async {
    if (Config.authRequired) {
      if (await auth.check()) {
        // await 5.delay(() => Get.offAllNamed(Config.homeUrl));
        await 5.delay(() => Get.offAllNamed(Config.homeUrl));
      } else {
        await 5.delay(() => Get.offAllNamed(AuthRoutes.login));
      }
    } else {
      await 5.delay(() => Get.offAllNamed(Config.homeUrl));
    }
  }
}
