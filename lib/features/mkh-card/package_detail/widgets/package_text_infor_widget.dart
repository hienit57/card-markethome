import 'package:card_markethome/index.dart';

class PackageTextInforWidget extends StatelessWidget {
  const PackageTextInforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PackageDetailCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: BlocBuilder<PackageDetailCubit, PackageDetailState>(
        buildWhen: (previous, current) =>
            previous.onFetchCardPackageDetail !=
            current.onFetchCardPackageDetail,
        builder: (context, state) {
          return SizedBox(
            width: context.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THÔNG TIN CHI TIẾT THẺ',
                  style: context.text.titleMedium?.copyWith(),
                ),
                const SizedBox(height: 8),
                ExpandableTextWidget(
                  text: cubit.state.descriptionCardPackage,
                  lengthExpandable: 146,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
