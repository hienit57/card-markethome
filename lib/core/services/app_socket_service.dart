import 'dart:async';

import 'package:card_markethome/core/helpers/platform_helper.dart';
import 'package:card_markethome/core/index.dart';
import 'package:card_markethome/main.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// AppSocketEvent
Map<String, String> appSocketEvent = {};

class AppSocketService {
  factory AppSocketService() {
    return _singleton;
  }

  AppSocketService._internal();

  static final AppSocketService _singleton = AppSocketService._internal();

  Socket? _socket;

  Socket? get socket => _socket;

  Future<void> connect() async {
    await _initSocket();
    _connect();
  }

  Future<void> disconnect() async {
    _socket?.disconnect();
    _socket?.dispose();
  }

  Future<void> _initSocket() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId = '';

    if (isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
    } else if (isWeb) {
      final WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      deviceId = webInfo.userAgent ?? 'unknown_browser';
    } else {
      deviceId = 'unknown_device';
    }

    InternetConnection().onStatusChange.listen(_updateConnectionStatus);

    final token = AppConfigSingleton.accessToken;

    debugPrint('[AppSocketService] token: $token');

    _socket = io(
      '${flavorSettings.apiBaseUrl}/user?deviceId=$deviceId',
      OptionBuilder()
          .setTransports(['websocket'])
          .setPath('/api/socket.io')
          .disableAutoConnect()
          .enableForceNewConnection()
          .enableReconnection()
          .setReconnectionAttempts(3)
          .setTimeout(10000)
          .setAuth({
            'token': '$token',
          })
          .build(),
    );
  }

  void _connect() {
    _socket?.connect();

    _socket?.on('connect', (data) {
      debugPrint('[AppSocketService] connect $data');
    });

    _socket?.onConnect((_) {
      debugPrint('Connected to the socket server');
    });

    _socket?.onReconnect((data) {
      debugPrint('[AppSocketService] reconnect $data');
    });

    _socket?.on('connect_timeout', (_) {
      debugPrint('[AppSocketService] connect_timeout');
    });

    _socket?.on('error', (_) {
      debugPrint('[AppSocketService] error');
    });

    _socket?.on('reconnecting', (_) {
      debugPrint('[AppSocketService] reconnecting');
    });

    _socket?.onDisconnect((data) {
      debugPrint('[AppSocketService] disconnect $data');
    });

    _socket?.on('reconnect_failed', (_) {
      debugPrint('[AppSocketService] reconnect_failed');
    });

    _socket?.on('reconnect_error', (_) {
      debugPrint('[AppSocketService] reconnect_error');
    });

    _socket?.on('reconnect_attempt', (_) {
      debugPrint('[AppSocketService] reconnect_attempt');
    });
  }

  void _updateConnectionStatus(InternetStatus event) {}
}
