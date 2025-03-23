import 'package:card_markethome/index.dart';

class MarshopReferralListView extends StatelessWidget {
  const MarshopReferralListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarshopRefferalCubit, MarshopRefferalState>(
      buildWhen: (previous, current) => previous.marshops != current.marshops,
      builder: (context, state) {
        final marshops = state.marshops;
        if (marshops.isNotEmpty) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final marshop = marshops[index];
              return _buildMarshopReferralItem(context, marshop);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemCount: 10,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildMarshopReferralItem(BuildContext context, MarshopModel marshop) {
    final pDoneId = marshop.user?.pDoneId;
    return GestureDetector(
      onTap: () {
        Navigation.pop(context, result: pDoneId);
      },
      child: Row(
        children: [
          if (marshop.user?.avatar != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AppImage(
                imageUrl: marshop.user?.avatar ?? '',
                width: 40,
                height: 40,
              ),
            )
          ] else ...[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.textAccent.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              child: Assets.lib_assets_icons_ic_user.svg(
                color: AppColors.white,
                fit: BoxFit.scaleDown,
              ),
            )
          ],
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                marshop.user?.displayName ?? '',
                style: context.text.titleLarge,
              ),
              const SizedBox(height: 2),
              Text(
                'ID: $pDoneId',
                style: context.text.titleMedium?.copyWith(
                  color: AppColors.gray300,
                  fontSize: 11,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
