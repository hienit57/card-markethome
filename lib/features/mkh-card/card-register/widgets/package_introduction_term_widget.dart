import 'package:card_markethome/index.dart';

class PackageIntroductionAndTermWidget extends StatelessWidget {
  const PackageIntroductionAndTermWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardRegisterCubit, CardRegisterState>(
      buildWhen: (previous, current) =>
          previous.onFetchCardPackagesIntroduction !=
          current.onFetchCardPackagesIntroduction,
      builder: (context, state) {
        final image = state.cardPackagesIntroductionResponse?.value?.image;

        if (image != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40BFBFBF),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 156,
                    width: context.maxWidth,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AppImage(
                        imageUrl: image,
                        usePlaceHolder: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Điều khoản và dịch vụ',
                          style: context.text.titleMedium?.copyWith(
                            color: AppColors.textAccent,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Assets.lib_assets_icons_ic_arrow_right.svg(
                          color: AppColors.textAccent,
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(width: 6),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
