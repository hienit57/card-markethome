import 'package:card_markethome/index.dart';

class PurchaseBatchTransactionDetailPage extends StatelessWidget {
  const PurchaseBatchTransactionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: context.maxWidth,
            height: context.maxHeight,
            child: const AppImage(
              assetImage: Assets.lib_assets_images_img_bg_card_detail,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.kPaddingToolBar + 10,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appbar(context),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    const PurchaseBatchTransactionDetailPainter(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _statusTransaction(context),
                          DeviderWidget(
                            isVertical: true,
                            sizePadding: 16,
                            color: AppColors.colorE8E8E8,
                            height: 1,
                            width: context.maxWidth,
                          ),
                          _infoOwnerCard(context),
                          const SizedBox(height: 48),
                          _inforPurchaseBatch(context),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _appbar(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const AppImage(
              assetImage: Assets.lib_assets_icons_ic_arrow_back,
              width: 20,
              height: 20,
              color: AppColors.white,
            ),
          ),
          Text(
            'Chi tiết giao dịch',
            style: context.text.titleMedium?.copyWith(
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 20),
        ],
      );

  _statusTransaction(BuildContext context) => Row(
        children: [
          const AppImage(
            assetImage:
                Assets.lib_assets_icons_ic_waitting_confirm_purchase_batch,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chờ xác nhận',
                style: context.text.titleMedium?.copyWith(
                  fontSize: 16,
                  color: AppColors.colorF6B412,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '-5.000.000đ',
                style: context.text.titleMedium?.copyWith(
                  fontSize: 24,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          )
        ],
      );

  _infoOwnerCard(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chủ thẻ',
            style: context.text.titleSmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const AppImage(
                assetImage: Assets.lib_assets_icons_ic_tab_profile_selected,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguyễn Thị Lan',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'VN346KH76',
                    style: context.text.titleSmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      );

  _inforPurchaseBatch(BuildContext context) => Column(
        children: [
          const RowTitleContentWidget(
            title: 'Loại giao dịch',
            content: 'Mua gói Makethome',
          ),
          DeviderWidget(
            isVertical: true,
            sizePadding: 12,
            color: AppColors.colorE8E8E8,
            height: 1,
            width: context.maxWidth,
          ),
          const RowTitleContentWidget(
            title: 'Giá tiền',
            content: '5.000.000đ',
          ),
          DeviderWidget(
            isVertical: true,
            sizePadding: 12,
            color: AppColors.colorE8E8E8,
            height: 1,
            width: context.maxWidth,
          ),
          const RowTitleContentWidget(
            title: 'Số lượng D-One',
            content: '10.000 D-One',
          ),
          DeviderWidget(
            isVertical: true,
            sizePadding: 12,
            color: AppColors.colorE8E8E8,
            height: 1,
            width: context.maxWidth,
          ),
          const RowTitleContentWidget(
            title: 'Số lượng',
            content: '1',
          ),
          DeviderWidget(
            isVertical: true,
            sizePadding: 12,
            color: AppColors.colorE8E8E8,
            height: 1,
            width: context.maxWidth,
          ),
          const RowTitleContentWidget(
            title: 'Tổng tiền thanh toán',
            content: '5.000.000đ',
          ),
          DeviderWidget(
            isVertical: true,
            sizePadding: 12,
            color: AppColors.colorE8E8E8,
            height: 1,
            width: context.maxWidth,
          ),
          const RowTitleContentWidget(
            title: 'Hạn mức nhận được',
            content: '10.000 D-One',
          ),
        ],
      );
}
