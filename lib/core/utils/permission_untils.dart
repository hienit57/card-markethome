import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<bool> checkPhotoPermission() async {
    late PermissionStatus status;

    if (Platform.isAndroid) {
      if (await isAndroid13AndAbove()) {
        // Kiểm tra quyền truy cập ảnh cho Android 13+
        status = await Permission.photos.status;
        if (!status.isGranted) {
          status = await Permission.photos.request();
        }
      } else {
        // Kiểm tra quyền lưu trữ cho Android thấp hơn 13
        status = await Permission.storage.status;
        if (!status.isGranted) {
          status = await Permission.storage.request();
        }
      }
    } else if (Platform.isIOS) {
      // Kiểm tra quyền truy cập thư viện ảnh trên iOS
      status = await Permission.photos.status;
      if (!status.isGranted) {
        status = await Permission.photos.request();
      }
    }

    return status.isGranted || status.isLimited;
  }

  static Future<bool> checkVideoPermission() async {
    late PermissionStatus status;

    if (Platform.isAndroid) {
      if (await isAndroid13AndAbove()) {
        status = await Permission.videos.status;
        if (!status.isGranted) {
          status = await Permission.videos.request();
        }
      } else {
        status = await Permission.storage.status;
        if (!status.isGranted) {
          status = await Permission.storage.request();
        }
      }
    } else if (Platform.isIOS) {
      // Kiểm tra quyền truy cập camera trên iOS
      status = await Permission.camera.status;
      if (!status.isGranted) {
        status = await Permission.camera.request();
      }

      // Nếu có quyền camera, tiếp tục kiểm tra quyền thư viện ảnh
      if (status.isGranted) {
        status = await Permission.photos.status;
        if (!status.isGranted) {
          status = await Permission.photos.request();
        }
      }
    }

    return status.isGranted;
  }

  static Future<bool> isAndroid13AndAbove() async {
    if (Platform.isIOS) return false;
    final deviceInfo = DeviceInfoPlugin();
    final info = await deviceInfo.androidInfo;
    return int.parse(info.version.release) >= 13;
  }
}
