import 'package:card_markethome/index.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardInformationWidget extends StatelessWidget {
  const CardInformationWidget({super.key, required this.cardInfor});

  final WalletModel? cardInfor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImage(
          imageUrl: cardInfor?.rank?.backgroundUrl ?? '',
          height: 189,
          width: context.maxWidth,
          fit: BoxFit.fill,
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: _userInfor(context),
        ),
      ],
    );
  }

  Widget _userInfor(BuildContext context) {
    final qrData = {
      "Tên chủ thẻ": cardInfor?.user?.displayName,
      "ID": cardInfor?.user?.pDoneId,
      "Hạng thẻ": cardInfor?.rank?.name,
    };
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AppImage(
            imageUrl: cardInfor?.user?.avatar ?? '',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
            errorWidget: const AppImage(
              assetImage: Assets.lib_assets_icons_ic_user,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  cardInfor?.user?.displayName ?? '',
                  style: context.text.titleMedium?.copyWith(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 10),
                AppImage(
                  imageUrl: cardInfor?.rank?.rankTextBackgroundUrl ?? '',
                  width: 49,
                  height: 14,
                  fit: BoxFit.fitHeight,
                  errorWidget: const SizedBox.shrink(),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              'ID: ${cardInfor?.user?.pDoneId}',
              style: context.text.titleMedium?.copyWith(
                fontSize: 12,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const Spacer(),
        Stack(
          children: [
            const AppImage(
              assetImage: Assets.lib_assets_images_img_frame_qr,
              width: 53,
              height: 53,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: QrImageView(
                  data: jsonEncode(qrData),
                  size: 45,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
