import 'package:card_markethome/index.dart';

class PackageDetailBottomWidget extends StatelessWidget {
  const PackageDetailBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomSolidButton(
        title: 'Mua ngay',
        backgroundColor: AppColors.textAccent,
        onTap: () => onBuyNow(context),
      ),
    );
  }

  void onBuyNow(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    height: 4,
                    width: 32,
                    decoration: BoxDecoration(
                      color: AppColors.schemesOutline,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              Assets.lib_assets_images_img_rice_book_demo.image(
                            width: 40,
                            height: 52,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gói MarketHome',
                              style: context.text.titleMedium?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Mô tả gói',
                              style: context.text.titleSmall?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      '5.000.000đ',
                      style: context.text.titleMedium?.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(height: 1, color: AppColors.colorE8E8E8),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vui lòng chọn số lượng',
                      style: context.text.titleSmall?.copyWith(),
                    ),
                    NumberStepperWidget(
                      initialValue: 0,
                      sizeButton: 24,
                      radiusButton: 8,
                      maxValue: 100,
                      onChange: (value) {},
                    )
                  ],
                ),
              ),
              Container(height: 1, color: AppColors.colorE8E8E8),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16.0, bottom: 12),
                child: Text(
                  'Mã giới thiệu',
                  style: context.text.titleSmall?.copyWith(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppTextField(
                  borderColor: AppColors.colorE8E8E8,
                  placeholder: 'Nhập mã giới thiệu',
                  borderRadius: 6,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 16, top: 16.0, bottom: 12),
                child: SizedBox(
                  width: context.maxWidth,
                  child: Text(
                    'Tổng tiền: 5.000.000đ',
                    style: context.text.titleLarge?.copyWith(
                      fontSize: 16,
                      color: AppColors.textAccent,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomSolidButton(
                  title: 'Mua',
                  backgroundColor: AppColors.textAccent,
                  onTap: () => onBuyNow(context),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
