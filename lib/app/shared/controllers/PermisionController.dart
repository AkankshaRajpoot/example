import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../helpers/Global.dart';

class PermissionController extends GetxController {
  static final PermissionController instance = Get.find<PermissionController>();

  /// Observables
  var _cameraPermission = false.obs;
  var _storagePermission = false.obs;
  var _locationPermission = false.obs;
  var _audioPermission = false.obs;
  var _appTrackingTransparencyPermission = false.obs;

  /// Getters
  bool get cameraPermission => _cameraPermission.value;

  bool get storagePermission => _storagePermission.value;

  bool get locationPermission => _locationPermission.value;

  bool get audioPermission => _audioPermission.value;

  bool get appTrackingTransparencyPermission => _appTrackingTransparencyPermission.value;

  @override
  void onInit() {
    super.onInit();
  }

  /// ======================
  /// Permission Access
  /// ======================
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.denied) {
        return false;
      }
    }
    return false;
  }

  /// ======================
  /// Storage Access
  /// ======================
  ///Switch used this method
  void storagePermissionRequest(bool value) async {
    _storagePermission(!_storagePermission.value);
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.storage)) {
        _storagePermission(true);
      } else {
        _storagePermission(false);
      }
    } else {
      if (Platform.isIOS) {
        if (await _requestPermission(Permission.storage)) {
          _storagePermission(true);
        } else {
          _storagePermission(false);
        }
      }
    }
  }

  /// ======================
  /// Storage Access
  /// ======================
  /// Direct Permission
  Future<bool> requestStoragePermission() async {
    if (await Permission.storage.isGranted) {
      return true;
    } else {
      var result = await Permission.storage.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.denied) {
        return false;
      }
    }
    return false;
  }

  /// ======================
  /// app Tracking Transparency Permission
  /// ======================
  ///Switch used this method
  void appTrackingTransparencyPermissionRequest(bool value) async {
    _appTrackingTransparencyPermission(!_appTrackingTransparencyPermission.value);
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.appTrackingTransparency)) {
        _appTrackingTransparencyPermission(true);
      } else {
        _appTrackingTransparencyPermission(false);
      }
    } else {
      if (Platform.isIOS) {
        if (await _requestPermission(Permission.appTrackingTransparency)) {
          _appTrackingTransparencyPermission(true);
        } else {
          _appTrackingTransparencyPermission(false);
        }
      }
    }
  }

  /// ======================
  ///  app Tracking Transparency Access
  /// ======================
  /// Direct Permission
  Future<bool> requestAppTrackingTransparencyPermission() async {
    if (await Permission.appTrackingTransparency.isGranted) {
      return true;
    } else {
      var result = await Permission.appTrackingTransparency.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.denied) {
        return false;
      }
    }
    return false;
  }

  /// ======================
  /// Location Permission
  /// ======================
  ///Switch used this method
  void locationPermissionRequest(bool value) async {
    _locationPermission(!_locationPermission.value);
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.location)) {
        _locationPermission(true);
      } else {
        _locationPermission(false);
      }
    } else {
      if (Platform.isIOS) {
        if (await _requestPermission(Permission.location)) {
          _locationPermission(true);
        } else {
          _locationPermission(false);
        }
      }
    }
  }

  /// ======================
  ///  Location Access
  /// ======================
  /// Direct Permission
  Future<bool> requestLocationPermission() async {
    log.w(Permission.location.status.isGranted);
    log.w(Permission.location.status.isDenied);
    if (await Permission.location.isGranted) {
       return true;
    } else {
      var result = await Permission.location.request();
      if (result == PermissionStatus.granted) {
         return true;
      } else if (result == PermissionStatus.denied) {
         return false;
      }
    }
     return false;
  }

  /// ======================
  /// Camera Permission Access
  /// ======================
  ///Switch used this method
  void cameraPermissionRequest(bool value) async {
    _cameraPermission(!_cameraPermission.value);
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.camera)) {
        _cameraPermission(true);
      } else {
        _cameraPermission(false);
      }
    } else {
      if (Platform.isIOS) {
        if (await _requestPermission(Permission.camera)) {
          _cameraPermission(true);
        } else {
          _cameraPermission(false);
        }
      }
    }
  }

  /// ======================
  ///  Camera Access
  /// ======================
  /// Direct Permission
  Future<bool> requestCameraPermission() async {
    if (await Permission.camera.isGranted) {
      return true;
    } else {
      var result = await Permission.camera.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.denied) {
        return false;
      }
    }
    return false;
  }

  /// ======================
  /// Audio Permission Access
  /// ======================
  ///Switch used this method
  void audioPermissionRequest(bool value) async {
    _audioPermission(!_audioPermission.value);
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.microphone)) {
        _audioPermission(true);
      } else {
        _audioPermission(false);
      }
    } else {
      if (Platform.isIOS) {
        if (await _requestPermission(Permission.microphone)) {
          _audioPermission(true);
        } else {
          _audioPermission(false);
        }
      }
    }
  }

  /// ======================
  ///  Audio Access
  /// ======================
  /// Direct Permission
  Future<bool> requestAudioPermission() async {
    if (await Permission.audio.isGranted) {
      return true;
    } else {
      var result = await Permission.audio.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.denied) {
        return false;
      }
    }
    return false;
  }
}
