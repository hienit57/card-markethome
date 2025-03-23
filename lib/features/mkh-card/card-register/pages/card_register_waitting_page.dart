import 'dart:ui';
import 'package:card_markethome/index.dart';

enum EventTransactionEnum {
  agentConfirm,
  cancelTransaction,
  agentConfirmReceipt,
}

enum TypeListenSocketEnum {
  userPersonalDOneTransactionAcknowledged(
      'USER_PERSONAL_D_ONE_TRANSACTION_ACKNOWLEDGED'),
  userPersonalDOneTransactionResult('USER_PERSONAL_D_ONE_TRANSACTION_RESULT');

  final String type;

  const TypeListenSocketEnum(this.type);
}

class CardRegisterWaittingPage extends StatefulWidget {
  const CardRegisterWaittingPage({
    super.key,
    this.title,
    this.isShowCountdown = true,
    this.typeListenSocket,
  });

  final String? title;
  final bool? isShowCountdown;
  final TypeListenSocketEnum? typeListenSocket;

  @override
  State<CardRegisterWaittingPage> createState() =>
      _CardRegisterWaittingPageState();
}

class _CardRegisterWaittingPageState extends State<CardRegisterWaittingPage>
    with TimerMixin {
  @override
  void initState() {
    super.initState();
    startTimer();
    executeFunctionAtInterval();

    _socketHandler();
  }

  Future<void> _socketHandler() async {
    await AppSocketService().connect();

    switch (widget.typeListenSocket) {
      case TypeListenSocketEnum.userPersonalDOneTransactionAcknowledged:
        return AppSocketService().socket?.on(
          widget.typeListenSocket?.type ?? '',
          (data) {
            debugPrint(
                '[DialogWaitingAgencyConfirm] USER_PERSONAL_D_ONE_TRANSACTION_ACKNOWLEDGED data: $data');

            if (data is Map<String, dynamic>) {
              final metadata = data['metadata'];
              if (metadata is Map<String, dynamic> &&
                  metadata['transactionId'] != null) {
                Navigation.pop(
                  context,
                  result: EventTransactionEnum.agentConfirm,
                );
              }
            }
          },
        );

      case TypeListenSocketEnum.userPersonalDOneTransactionResult:
        return AppSocketService().socket?.on(
          widget.typeListenSocket?.type ?? '',
          (data) {
            debugPrint(
                '[DialogWaitingAgencyConfirm] USER_PERSONAL_D_ONE_TRANSACTION_RESULT data: $data');

            if (data is Map<String, dynamic>) {
              final metadata = data['metadata'];
              if (metadata is Map<String, dynamic> && metadata['status'] == 1) {
                Navigation.pop(
                  context,
                  result: EventTransactionEnum.agentConfirmReceipt,
                );
              }
            }
          },
        );
      case null:
    }
  }

  @override
  void functionAtInterval() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: context.maxWidth,
            child: AppImage(
              assetImage: Assets.lib_assets_images_img_splash_card_mkh,
              fit: BoxFit.fill,
              height: context.maxHeight,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              width: context.maxWidth,
              height: context.maxHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black.withOpacity(0),
                    AppColors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: context.kPaddingToolBar + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 200),
                const LoadingAnimation(),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 47),
                  child: Text(
                    widget.title ?? '',
                    style: context.text.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (widget.isShowCountdown == true) ...[
                  const Spacer(),
                  builderTimer(
                    (context, time, child) {
                      final String timeStr = DateTimeMixin.secondsToSS(time);
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 16),
                        child: Text(
                          'Giao dịch sẽ tự động hủy sau ${timeStr}s',
                          style: context.text.titleSmall?.copyWith(
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomSolidButton(
                      radius: 8,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      backgroundColor: AppColors.white,
                      title: 'Huỷ đăng ký',
                      titleStyle: context.text.titleMedium?.copyWith(
                        color: AppColors.textAccent,
                        fontSize: 16,
                      ),
                      onTap: () async {
                        final result = await ConfirmationDialog.show(
                          context: context,
                          title: 'Xác nhận',
                          message:
                              'Bạn có chắc chắn muốn huỷ đăng ký thẻ MarketHome không?',
                          onCancel: () => Navigation.pop(context),
                          onConfirm: () {
                            Navigation.pop(context, result: true);
                          },
                        );
                        if (result == true) {
                          Navigation.pop(
                            context,
                            result: EventTransactionEnum.cancelTransaction,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 26),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get isCountDown => true;

  @override
  void onCompleteTimer() {
    ConfirmationDialog.show(
      context: context,
      title: 'Xác nhận',
      message: 'Kết thúc giao dịch!!',
      onCancel: () => Navigation.popUntil(
        context,
        NavigationRouter.splash.path,
      ),
      onConfirm: () {
        Navigation.popUntil(
          context,
          NavigationRouter.splash.path,
        );
      },
    );
  }

  @override
  int get timeInputLimit => 600;

  @override
  int get timeInterval => 15;
}
