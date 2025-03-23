import 'package:card_markethome/features/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'handlers.dart';

enum NavigationRouter {
  splash,
  mainTab,
  home,
  cardDetail,
  packageDetail,
  transactionDetail,
  profileMe,
  purchaseBatch,
  purchaseBatchTransactionDetail,
  barCodeScanner,
  cardRegister,
  marshopRefferal,
  cardRegisterWaitting,
}

extension NavigationRouterExtension on NavigationRouter {
  String get path {
    switch (this) {
      case NavigationRouter.splash:
        return '/';
      case NavigationRouter.mainTab:
        return '/main-tab';
      case NavigationRouter.home:
        return '/home';
      case NavigationRouter.barCodeScanner:
        return '/bar-code-scanner';
      case NavigationRouter.cardDetail:
        return '/card-detail';
      case NavigationRouter.packageDetail:
        return '/card-package-detail';
      case NavigationRouter.transactionDetail:
        return '/transaction-detail';
      case NavigationRouter.profileMe:
        return '/profile-me';
      case NavigationRouter.purchaseBatch:
        return '/purchase-batch';
      case NavigationRouter.purchaseBatchTransactionDetail:
        return '/purchase-batch-transaction-detail';
      case NavigationRouter.cardRegister:
        return '/card-register';
      case NavigationRouter.marshopRefferal:
        return '/marshop-refferal';
      case NavigationRouter.cardRegisterWaitting:
        return '/card-register-waitting';
    }
  }
}

class Routes {
  static void configureRoutes(FluroRouter router) {
    router
      ..notFoundHandler = Handler(handlerFunc: (context, params) {
        debugPrint("Route was not found");
        return null;
      })
      ..define(NavigationRouter.splash.path, handler: splashHandler)
      ..define(NavigationRouter.mainTab.path, handler: mainTabHandler)
      ..define(NavigationRouter.home.path, handler: homeHandler)
      ..define(NavigationRouter.cardDetail.path, handler: cardDetailHandler)
      ..define(NavigationRouter.packageDetail.path,
          handler: packageDetailHandler)
      ..define(NavigationRouter.transactionDetail.path,
          handler: transactionDetailHandler)
      ..define(NavigationRouter.profileMe.path, handler: profileMeHandler)
      ..define(NavigationRouter.purchaseBatch.path,
          handler: purchaseBatchHandler)
      ..define(NavigationRouter.purchaseBatchTransactionDetail.path,
          handler: purchaseBatchTransactionDetailHandler)
      ..define(NavigationRouter.barCodeScanner.path,
          handler: barCodeScannerHandler)
      ..define(NavigationRouter.cardRegister.path, handler: cardRegisterHandler)
      ..define(NavigationRouter.marshopRefferal.path,
          handler: marshopRefferalHandler)
      ..define(NavigationRouter.cardRegisterWaitting.path,
          handler: cardRegisterWaittingHandler);
  }
}
