import 'package:card_markethome/index.dart';

class CardRegisterPage extends StatelessWidget {
  const CardRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CardRegisterCubit>(
          create: (context) => CardRegisterCubit(
            cardUsecase: context.read<CardUsecase>(),
            globalConfigByKeyUsecase: context.read<GlobalConfigByKeyUsecase>(),
            marshopUsecase: context.read<MarshopUsecase>(),
          )..initData(),
        ),
        BlocProvider<AddressSelectorCubit>(
          create: (context) => AddressSelectorCubit(
            addressSelectorUsecase: context.read<AddressSelectorUsecase>(),
          )..initData(),
        ),
      ],
      child: Scaffold(
        appBar: const CardRegisterAppBar(),
        backgroundColor: AppColors.colorF3F3F3,
        body: Column(
          children: [
            const StepWidget(),
            Expanded(
              child: BlocBuilder<CardRegisterCubit, CardRegisterState>(
                buildWhen: (previous, current) =>
                    previous.currentStep != current.currentStep,
                builder: (context, state) {
                  return SizedBox(
                    child: (() {
                      switch (state.currentStep) {
                        case RegisterStepEnum.step1:
                          return const CardRegisterInforPage();
                        case RegisterStepEnum.step2:
                          return const CardRegisterConfirmPage();
                        case RegisterStepEnum.step3:
                          return const CardRegisterPaymentPage();
                      }
                    }()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
