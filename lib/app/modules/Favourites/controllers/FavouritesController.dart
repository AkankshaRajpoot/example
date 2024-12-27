/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'package:get/get.dart';

import '../../../models/ApiResponse.dart';
import '../models/FavouriteModel.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';
import '../services/FavouritesService.dart';

class FavouritesController extends AppController {
  /// Creating Global Instance
  static FavouritesController get instance {
    if (!Get.isRegistered<FavouritesController>()) Get.put(FavouritesController());
    return Get.find<FavouritesController>();
  }

  /// Initialise [FavouritesModule] service
  final FavouritesService _favouritesService = FavouritesService.instance;

  var _favourite = <FavouriteModel>[].obs;
  List<FavouriteModel> get favourite => _favourite;

  @override
  void onInit() {
    super.onInit();
    getFavourite();
  }

  Future<void> getFavourite() async {
    try {
      setBusy(true);
      _favouritesService.init();
      ApiResponse response = await _favouritesService.getFavourite();

      if (response.hasError()) {
        setBusy(false);
        return;
      }
      if (response.hasData()) {
        _favourite.assignAll(List<FavouriteModel>.from(response.data['favourite'].map((x) => FavouriteModel.fromJson(x))));
      }
      setBusy(false);
      _favouritesService.close();
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "${e.toString()}"));
    }
  }
}

