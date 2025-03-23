import 'package:card_markethome/index.dart';

class PackageInforWidget extends StatelessWidget {
  const PackageInforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PackageDetailCubit>();
    return BlocBuilder<PackageDetailCubit, PackageDetailState>(
      buildWhen: (previous, current) =>
          previous.onFetchCardPackageDetail != current.onFetchCardPackageDetail,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AppImage(
                      imageUrl: cubit.state.imageCardPackage,
                      width: 70,
                      height: 89,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.state.nameCardPackage,
                        style: context.text.titleLarge?.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          cubit.state.priceCardPackage,
                          style: context.text.titleMedium?.copyWith(
                            color: AppColors.textAccent,
                          ),
                        ),
                      ),
                      Text(
                        'Tự động sinh lời từ hạn mức mà bạn nạp vào',
                        style: context.text.titleSmall?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Thời hạn',
                          style: context.text.titleSmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '1 năm',
                          style: context.text.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      color: AppColors.colorE8E8E8,
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Đã bán',
                          style: context.text.titleSmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cubit.state.cardPackageSold.toString(),
                          style: context.text.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      color: AppColors.colorE8E8E8,
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Còn lại',
                          style: context.text.titleSmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cubit.state.cardPackageTotal.toString(),
                          style: context.text.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
