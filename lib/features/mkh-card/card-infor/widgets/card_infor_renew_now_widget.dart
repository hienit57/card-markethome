import 'package:card_markethome/index.dart';

class CardInforRenewNowWidget extends StatelessWidget {
  const CardInforRenewNowWidget({super.key, required this.cardInfor});

  final WalletModel? cardInfor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 45),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: AppColors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thẻ của bạn sắp đến đợt gia hạn',
                style: context.text.titleMedium?.copyWith(
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Gia hạn ngay',
                style: context.text.titleMedium?.copyWith(
                  fontSize: 12,
                  color: AppColors.textAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
