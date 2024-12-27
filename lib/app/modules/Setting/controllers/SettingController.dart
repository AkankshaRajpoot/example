/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';

import '../../../helpers/Global.dart';
import '../../../models/LanguageModel.dart';
import '../models/SettingModel.dart';
import '../../../shared/controllers/AppController.dart';
import '../services/SettingService.dart';

class SettingController extends AppController {
  /// Creating Global Instance
  static SettingController get instance {
    if (!Get.isRegistered<SettingController>()) Get.put(SettingController());
    return Get.find<SettingController>();
  }

  /// Initialise [SettingModule] service
  final SettingService _settingService = SettingService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  var _languages = <LanguageModel>[].obs;
  List<LanguageModel> get languages => _languages;
  var _setting = SettingModel().obs;
  SettingModel get setting => _setting.value;
  var _checkDelete = false.obs;
  bool get checkDelete => _checkDelete.value;

  /// --- Functionality Handlers ---
  /// Observables & Getters

  // Add Scoped Var Here...


  @override
  void onInit() {
    super.onInit();
    getSettings();
    applyLocale(setting.appLocale);
    getLanguages();
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

  void onCheck(bool value) {
    _checkDelete(value);
  }
  /// --- Form Functionalities Methods ---
  void getSettings() {
    if (storage.read('settings') == null) {
      storage.write('settings', jsonEncode({"sound": true, "notifications": true, "locale": 'en'}));
    }
    _setting(SettingModel.fromJsom(jsonDecode(storage.read('settings'))));
    _setting.refresh();
  }
  Future<void> getLanguages() async {
    final jsonData = await rootBundle.rootBundle.loadString('assets/langs.json');
    //decode json data as list
    final list = json.decode(jsonData) as List<dynamic>;
    _languages.assignAll(List<LanguageModel>.from(list.map((e) => LanguageModel.fromJson(e))));
  }

  void storeSetting({required String key, dynamic value}) async {
    Map<String, dynamic> _set = jsonDecode(storage.read('settings'));
    if (value != null) _set[key] = value;
    await storage.write('settings', jsonEncode(_set));
    if (key == 'locale') applyLocale(value);
    getSettings();
  }

///
  /// Example usage:
  /// ```dart
  /// SearchableDialog(
  ///     onChanged: (value) {
  ///       controller.settingController.storeSetting(key: 'locale', value: value);
  ///       playAudio("click");
  ///     },
  ///     value: controller.settingController.setting.appLocale!,
  ///     placeholder: "Select Language",
  ///     options: [
  ///       DropDownItems(
  ///         label: "Select Language",
  ///         value: 'en',
  ///       ),
  ///       ...List.generate(controller.settingController.languages.length, (index) {
  ///         LanguageModel language = controller.settingController.languages[index];
  ///         return DropDownItems(
  ///           label: '${language.name}',
  ///           value: '${language.code}',
  ///         );
  ///       }),
  ///     ]),
  /// ```
  ///

}
