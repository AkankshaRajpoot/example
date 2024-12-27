/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'package:get/get.dart';

import '../../../shared/controllers/AppController.dart';
import '../services/SearchService.dart';

class SearchhController extends AppController {
  /// Create and get the instance of the controller
  static SearchhController get instance {
    if (!Get.isRegistered<SearchhController>()) Get.put(SearchhController());
    return Get.find<SearchhController>();
  }

  /// Initialise [SearchModule] service
  final SearchService _searchService = SearchService.instance;

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
    /// Do something here
  }
  /// --- Core Functionalities Methods ---
  // Index
  Future<void> index({bool refresh = false}) async {
    try {
      setBusy(true);

      // Code here...

      setBusy(false);
    } on Exception catch (e) {
      print(e);
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

