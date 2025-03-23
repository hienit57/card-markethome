import 'package:card_markethome/index.dart';

class CardInforWidget extends StatelessWidget {
  const CardInforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return BlocProvider(
      create: (context) => CardInforCubit(
        cardUsecase: context.read<CardUsecase>(),
      )..fetchUserCardInfo(),
      child: BlocBuilder<CardInforCubit, CardInforState>(
        buildWhen: (previous, current) =>
            previous.onFetchUserCardInfo != current.onFetchUserCardInfo,
        builder: (context, state) {
          if (state.userCardInfo?.wallet != null) {
            return CardInforRegisteredWidget(userCardInfo: state.userCardInfo);
          }
          return const CardInforNotRegisterWidget();
        },
      ),
    );
  }
}
