import 'package:card_markethome/index.dart';

class CardClassWidget extends StatelessWidget {
  const CardClassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardClassCubit(
        cardUsecase: context.read<CardUsecase>(),
      )..fetchCardRanks(),
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<CardClassCubit, CardClassState>(
      buildWhen: (previous, current) =>
          previous.onFetchCardRanks != current.onFetchCardRanks,
      builder: (context, state) {
        return CardClassCarouselWidget(cardRanks: state.cardRanks);
      },
    );
  }
}
