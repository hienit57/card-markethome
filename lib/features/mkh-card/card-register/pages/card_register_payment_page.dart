import 'package:card_markethome/index.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class CardRegisterPaymentPage extends StatefulWidget {
  const CardRegisterPaymentPage({super.key});

  @override
  State<CardRegisterPaymentPage> createState() =>
      _CardRegisterPaymentPageState();
}

class _CardRegisterPaymentPageState extends State<CardRegisterPaymentPage> {
  final ScreenshotController screenshotController = ScreenshotController();

  CardRegisterCubit get cubit => context.read<CardRegisterCubit>();

  @override
  Widget build(BuildContext context) {
    // return const _PaymentStatusWidget(isSuccess: true);
    return BlocBuilder<CardRegisterCubit, CardRegisterState>(
      buildWhen: (previous, current) =>
          previous.currentPayment != current.currentPayment,
      builder: (context, state) {
        if (state.currentPayment == CardRegisterPaymentEnum.paymentSuccess) {
          return const _PaymentStatusWidget(isSuccess: true);
        }
        if (state.currentPayment == CardRegisterPaymentEnum.paymentFailed) {
          return const _PaymentStatusWidget(isSuccess: false);
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context, S.current.payment_step1),
              const SizedBox(height: 16),
              _buildPaymentInfo(),
              const SizedBox(height: 24),
              _buildTitle(context, S.current.payment_step2),
              const SizedBox(height: 16),
              _buildTitle(context, S.current.payment_step3),
              const SizedBox(height: 24),
              _buildActionButtons(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(BuildContext context, String text) => Text(
        text,
        style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w500),
      );

  Widget _buildPaymentInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blueBEE0FF.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocBuilder<CardRegisterCubit, CardRegisterState>(
        buildWhen: (previous, current) =>
            previous.onCreateBillBuyCard != current.onCreateBillBuyCard,
        builder: (context, state) {
          final billInfo = state.billBuyCardResponse;

          final bankLogo = billInfo?.bankAccount?.bank?.logo ?? '';
          final bankNumber = billInfo?.bankAccount?.bankNumber ?? '';
          final bankHolder = billInfo?.bankAccount?.bankHolder ?? '';
          final transferContent = billInfo?.content ?? '';

          return Column(
            children: [
              AppImage(
                imageUrl: bankLogo,
                height: 40,
              ),
              Text(
                'Số TK: $bankNumber\nChủ TK: $bankHolder\nNội dung CK: $transferContent',
                textAlign: TextAlign.center,
                style: context.text.titleLarge?.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 16),
              Screenshot(
                controller: screenshotController,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppImage(
                    imageUrl:
                        'https://img.vietqr.io/image/${billInfo?.bankAccount?.bank?.code ?? 0}-${billInfo?.bankAccount?.bankNumber ?? ''}-qr-only.jpg?amount=${billInfo?.vndAmount ?? 0}&addInfo=${billInfo?.content ?? ''}',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue25,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () async {
                    saveQrImage(context);
                  },
                  icon: const Icon(Icons.download, color: Colors.white),
                  label: Text(
                    S.current.save_qr_code,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> saveQrImage(BuildContext context) async {
    try {
      // Capture screenshot of the QR code
      final image = await screenshotController.capture();

      if (image == null) {
        if (context.mounted) {
          showToastMessage('Lưu mã QR thất bại', ToastMessageType.error);
        }
        return;
      }

      // Save to gallery
      final result = await ImageGallerySaver.saveImage(
        image,
        name: 'QR_payment_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (context.mounted) {
        if (result['isSuccess']) {
          showToastMessage('Lưu mã QR thành công', ToastMessageType.success);
        } else {
          showToastMessage('Lưu mã QR thất bại', ToastMessageType.error);
        }
      }
    } catch (e) {
      showToastMessage('Lưu mã QR thất bại', ToastMessageType.error);
    }
  }

  Widget _buildActionButtons() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CommonOutlineButton(
              title: S.current.contact,
              onPressed: () {},
              colorOutline: AppColors.textAccent,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: BlocListener<CardRegisterCubit, CardRegisterState>(
              listenWhen: (previous, current) =>
                  previous.onConfirmPayment != current.onConfirmPayment,
              listener: (context, state) async {
                if (state.onConfirmPayment == FormzSubmissionStatus.success) {
                  final result = await Navigation.shared.push(
                    path: NavigationRouter.cardRegisterWaitting.path,
                    params: {
                      'title':
                          'Giao  dịch của bạn đang được kiểm tra, vui lòng chờ xử lý!',
                      'isShowCountdown': false,
                      'typeListenSocket': TypeListenSocketEnum
                          .userPersonalDOneTransactionResult,
                    },
                  );

                  if (result == EventTransactionEnum.agentConfirmReceipt) {
                    cubit.setCurrentPayment(
                      CardRegisterPaymentEnum.paymentSuccess,
                    );
                  }
                }
                if (state.onConfirmPayment == FormzSubmissionStatus.failure) {
                  ConfirmationDialog.showOnlyConfirm(
                    context: context,
                    title: 'Thông báo',
                    message:
                        'Giao  dịch của bạn đang được kiểm tra, vui lòng chờ xử lý!',
                  );
                }
              },
              child: CustomSolidButton(
                title: S.current.confirm,
                backgroundColor: AppColors.textAccent,
                onTap: () {
                  cubit.confirmPayment();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentStatusWidget extends StatelessWidget {
  final bool isSuccess;

  const _PaymentStatusWidget({
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppImage(
                    assetImage:
                        Assets.lib_assets_images_register_payment_success,
                    width: 300,
                  ),
                  const SizedBox(height: 32),
                  _buildText(
                      context,
                      isSuccess
                          ? S.current.payment_sucess
                          : S.current.payment_fail,
                      16,
                      FontWeight.w600),
                  const SizedBox(height: 16),
                  _buildText(context, S.current.payment_sucess_content, null,
                      null, AppColors.color4B4B4B),
                  const SizedBox(height: 16),
                  // Visibility(
                  //   visible: isSuccess,
                  //   child: GestureDetector(
                  //     onTap: () => showSharingInfoDialog(context),
                  //     child: _buildText(
                  //         context,
                  //         S.current.share_money_info,
                  //         null,
                  //         null,
                  //         AppColors.textAccent,
                  //         TextDecoration.underline),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            _buildActionButtons(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, String text, double? fontSize,
          FontWeight? fontWeight,
          [Color? color, TextDecoration? decoration]) =>
      Text(
        text,
        textAlign: TextAlign.center,
        style: context.text.titleMedium?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration,
        ),
      );

  Widget _buildActionButtons(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CommonOutlineButton(
              title: S.current.home,
              onPressed: () => Navigation.shared.push(
                path: NavigationRouter.mainTab.path,
              ),
              colorOutline: AppColors.textAccent,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomSolidButton(
              title: S.current.contact,
              backgroundColor: AppColors.textAccent,
              onTap: () {},
            ),
          )
        ],
      );

  Future<void> showSharingInfoDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            S.current.share_money_info,
            textAlign: TextAlign.center,
            style: context.text.headlineLarge
                ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 2,
                color: AppColors.colorE8E8E8,
                margin: const EdgeInsets.only(bottom: 16),
              ),
              _buildInfoRow(
                label: S.current.total_payment_money,
                value: '5.000.000đ',
              ),
              const SizedBox(height: 8),
              _buildInfoRow(
                label: S.current.marshop_money,
                value: '425.000đ',
              ),
              const SizedBox(height: 8),
              _buildInfoRow(
                label: S.current.boss_group_money,
                value: '25.000.000đ',
              ),
              const SizedBox(height: 8),
              _buildInfoRow(
                label: S.current.boss_team_money,
                value: '50.000.000đ',
              ),
            ],
          ),
          actions: [
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.textAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => Navigation.pop(context),
                  child: Text(
                    S.current.confirm,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow({required String label, required String value}) => Row(
        children: [
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Text(
            ' $value',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
}
