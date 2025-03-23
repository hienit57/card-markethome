import 'package:fluro/fluro.dart';

import '../../index.dart';

typedef BaseHandlerFunc = Widget? Function(
  BuildContext? context,
  Map<String, dynamic> parameters,
);

class BaseHandler extends Handler {
  BaseHandler({
    required BaseHandlerFunc handler,
  }) : super(handlerFunc: (context, params) {
          final newParams = context?.settings?.arguments is Map
              ? context?.settings?.arguments as Map
              : {};
          return handler(context, Map<String, dynamic>.from(newParams));
        });
}

Handler splashHandler = BaseHandler(handler: (context, params) {
  return const SplashPage();
});

Handler mainTabHandler = BaseHandler(handler: (context, params) {
  return const MainTabPage();
});

Handler homeHandler = BaseHandler(handler: (context, params) {
  return const HomePage();
});

Handler cardDetailHandler = BaseHandler(handler: (context, params) {
  return const CardDetailPage();
});

Handler packageDetailHandler = BaseHandler(handler: (context, params) {
  final agencyId = params['agencyId'];
  final packId = params['packId'];

  return PackageDetailPage(
    agencyId: agencyId,
    packId: packId,
  );
});

Handler transactionDetailHandler = BaseHandler(handler: (context, params) {
  return const TransactionDetailPage();
});

Handler profileMeHandler = BaseHandler(handler: (context, params) {
  return const ProfileOverviewPage();
});

Handler purchaseBatchHandler = BaseHandler(handler: (context, params) {
  return const PurchaseBatchPage();
});

Handler purchaseBatchTransactionDetailHandler =
    BaseHandler(handler: (context, params) {
  return const PurchaseBatchTransactionDetailPage();
});

Handler barCodeScannerHandler = BaseHandler(handler: (context, params) {
  return const BarcodeScannerScreen();
});

Handler cardRegisterHandler = BaseHandler(handler: (context, params) {
  return const CardRegisterPage();
});

Handler marshopRefferalHandler = BaseHandler(handler: (context, params) {
  return const MarshopRefferalPage();
});

Handler cardRegisterWaittingHandler = BaseHandler(handler: (context, params) {
  return CardRegisterWaittingPage(
    title: params['title'],
    isShowCountdown: params['isShowCountdown'],
    typeListenSocket: params['typeListenSocket'],
  );
});
