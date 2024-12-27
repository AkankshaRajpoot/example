/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'package:get/get.dart';
import 'package:ui_x/helpers/Toastr.dart';

import '../../../models/ApiResponse.dart';
import '../models/NotificationsModel.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';
import '../services/NotificationService.dart';

class NotificationController extends AppController {
  /// Creating Global Instance
  static NotificationController get instance {
    if (!Get.isRegistered<NotificationController>()) Get.put(NotificationController());
    return Get.find<NotificationController>();
  }

  /// Initialise [NotificationModule] service
  final NotificationService _notificationService = NotificationService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  // Add Scoped Var Here...

  /// --- Functionality Handlers ---
  /// Observables & Getters

  var _notificationList = <NotificationsModel>[].obs;
  List<NotificationsModel> get notificationList => _notificationList;

  @override
  void onInit() async {
    super.onInit();
    //getNotificationsList();
  }
  /// --- Core Functionalities Methods ---
  // Index
  Future<void> index() async {
    try {
      setBusy(true);
      _notificationService.init();
      ApiResponse response = await _notificationService.index();

      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        setBusy(false);
        return;
      }

      if (response.hasData()) {
        _notificationList.assignAll(List<NotificationsModel>.from(response.data.map((x) => NotificationsModel.fromJson(x))));
        setBusy(false);
        _notificationService.close();
      }
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "${e.toString()}"));
    }
  }
  //Show
  Future<void> show({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  // Create
  Future<void> create({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  // Store
  Future<void> store({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  //Edit
  Future<void> edit({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  // Update
  Future<void> patch({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  //Delete
  Future<void> delete({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
    }
  }

  /// --- Common Functionalities Methods ---

  /// --- Supporting Functionalities Methods ---

  /// --- Form Functionalities Methods ---


}
