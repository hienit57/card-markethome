import 'package:card_markethome/index.dart';

class CardDetailBottomWidget extends StatelessWidget {
  const CardDetailBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: context.maxWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: context.text.titleSmall,
                children: [
                  TextSpan(
                    text: 'Bạn cần thêm ',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextSpan(
                    text: '10.000 D-One',
                    style: context.text.titleLarge?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextSpan(
                    text: ' để lên hạng Platium',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            CustomSolidButton(
              title: 'Nâng cấp ngay',
              backgroundColor: AppColors.textAccent,
              onTap: () {
                Navigation.shared.push(
                  path: NavigationRouter.packageDetail.path,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
