import 'dart:async';
import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Navigation {
  static Navigation shared = Navigation();
  late FluroRouter _router;
  late GlobalKey<NavigatorState> _key;
  late RouteObserver<ModalRoute> _observer;

  static TransitionType get clearTransition => TransitionType.fadeIn;

  static TransitionType get presentTransition => (Platform.isIOS || Platform.isMacOS) ? TransitionType.nativeModal : TransitionType.inFromBottom;

  Navigation() {
    _router = FluroRouter();
    _key = GlobalKey<NavigatorState>();
    _observer = RouteObserver<ModalRoute>();
  }

  GlobalKey<NavigatorState> get getKey => _key;

  FluroRouter get getRouter => _router;

  BuildContext? get getContext => _key.currentContext;

  RouteObserver<ModalRoute> get observer => _observer;

  static Future<String?> getCurrentRoute() async {
    final completer = Completer<String?>();
    Navigation.shared.getKey.currentState?.popUntil((route) {
      completer.complete(route.settings.name);
      return true;
    });
    return completer.future;
  }

  Future<T?> push<T>({
    BuildContext? context,
    required String path,
    Map<String, dynamic>? params,
  }) async {
    return _navigate<T>(
      context: context,
      path: path,
      params: params,
    );
  }

  Future<T?> present<T>({
    BuildContext? context,
    required String path,
    Map<String, dynamic>? params,
  }) async {
    return _navigate<T>(
      context: context,
      path: path,
      params: params,
      clearStack: false,
      transition: presentTransition,
    );
  }

  Future<T?> replace<T>({
    BuildContext? context,
    required String path,
    Map<String, dynamic>? params,
  }) async {
    return _navigate<T>(
      context: context,
      path: path,
      params: params,
      clearStack: true,
      transition: clearTransition,
    );
  }

  static void pop(BuildContext context, {dynamic result}) {
    Navigation.shared.getRouter.pop(context, result);
  }

  static Future<void> popToRoot(BuildContext context, {Function()? onPopFinished}) async {
    Navigator.popUntil(context, (route) => route.isFirst);
    if (onPopFinished != null) onPopFinished();
  }

  static Future<void> popUntil(BuildContext context, String routePath, {Function()? onPopFinished}) async {
    Navigator.of(context).popUntil(ModalRoute.withName(routePath));
    if (onPopFinished != null) onPopFinished();
  }

  Future<T?> _navigate<T>({
    BuildContext? context,
    required String path,
    Map<String, dynamic>? params,
    bool clearStack = false,
    TransitionType transition = TransitionType.fadeIn,
  }) async {
    final ctx = context ?? Navigation.shared.getContext;
    final _params = params ?? {};

    final result = getRouter.navigateTo(
      ctx!,
      path,
      transition: transition,
      clearStack: clearStack,
      routeSettings: RouteSettings(arguments: _params),
    );
    return result is T ? result as T : null;
  }
}
