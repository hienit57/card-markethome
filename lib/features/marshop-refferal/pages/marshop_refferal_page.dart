import 'package:card_markethome/index.dart';

class MarshopRefferalPage extends StatelessWidget {
  const MarshopRefferalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'ID Marshop giới thiệu',
      ),
      body: BlocProvider(
        create: (context) => MarshopRefferalCubit(
          marshopUsecase: context.read<MarshopUsecase>(),
        )..fetchMarshops(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(17),
              child: Text(
                'Gợi ý',
                style: context.text.titleSmall?.copyWith(
                  color: AppColors.gray400,
                ),
              ),
            ),
            const Expanded(child: MarshopReferralListView())
          ],
        ),
      ),
    );
  }
}
