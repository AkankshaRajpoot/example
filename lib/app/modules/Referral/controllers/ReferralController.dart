/*
@category ZStarter Flutter
@ref     Defenzelite Product
@author  <Defenzelite hq@defenzelite.com>
@license <https://www.defenzelite.com Defenzelite Private Limited>
@version <zStarter: 202310-V1.2>
@link    <https://www.defenzelite.com>
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../shared/controllers/AppController.dart';
import '../services/ReferralService.dart';
import 'package:share_plus/share_plus.dart';

class ReferralController extends AppController {
  /// Creating Global Instance
  static ReferralController get instance {
    if (!Get.isRegistered<ReferralController>()) Get.put(ReferralController());
    return Get.find<ReferralController>();
  }

  /// Initialise [ReferralModule] service
  final ReferralService _referralService = ReferralService.instance;

  /// Initialize For Global Usage (Once per app run)

  /// --- System Handlers ---
  /// Observables & Getters

  var _isTap = false.obs;
  bool get isTap => _isTap.value;
  var _text = "".obs;
  String get text => _text.value;
  var _copyText = "".obs;
  String get copyText => _copyText.value;

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
  void randomText() {
    if (_text.value.isEmpty) {
      _text();

      update();
    }
  }

  void Copy(BuildContext context, String text) async {
    Clipboard.setData(new ClipboardData(text: text)).then((_) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Copied')));
    });
    _isTap(true);
    Future.delayed(Duration(seconds: 5), () {
      _isTap(false);
    });
    update();
  }

  void onShare() async {
    await Share.share(
        "nscx m zmxz c x,z"
    );
  }
  /// --- Form Functionalities Methods ---

}

