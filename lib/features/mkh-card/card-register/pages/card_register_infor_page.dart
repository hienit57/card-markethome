import 'package:card_markethome/index.dart';

class CardRegisterInforPage extends StatelessWidget {
  const CardRegisterInforPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: PackageIntroductionAndTermWidget(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CardPackageSelectorWidget(),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CardOwnerInforWidget(),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ReferralCodeWidget(),
        ),
        const SizedBox(height: 16),
        _buildButtonBottom(context)
      ],
    );
  }

  Widget _buildButtonBottom(BuildContext context) {
    final cubit = context.read<CardRegisterCubit>();
    return Container(
      color: AppColors.white,
      width: context.maxWidth,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CardRegisterCubit, CardRegisterState>(
              buildWhen: (previous, current) =>
                  previous.totalPriceBuyCard != current.totalPriceBuyCard,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền',
                      style: context.text.titleMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      state.totalPriceBuyCard,
                      style: context.text.titleLarge?.copyWith(
                        color: AppColors.textAccent,
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),
            BlocConsumer<CardRegisterCubit, CardRegisterState>(
              listenWhen: (previous, current) =>
                  previous.onCreateBillBuyCard != current.onCreateBillBuyCard,
              listener: (context, state) {
                if (state.onCreateBillBuyCard ==
                    FormzSubmissionStatus.success) {
                  cubit.fetchNextCardRank();
                  cubit.setCurrentStep(RegisterStepEnum.step2);
                }
                if (state.onCreateBillBuyCard ==
                    FormzSubmissionStatus.failure) {
                  ConfirmationDialog.showOnlyConfirm(
                    context: context,
                    title: 'Thông báo',
                    message: 'Hệ thống đang bảo trì, vui lòng thử lại sau',
                  );
                }
              },
              buildWhen: (previous, current) =>
                  previous.isDisableButtonRegister !=
                  current.isDisableButtonRegister,
              builder: (context, state) {
                return CustomSolidButton(
                  title: 'Đăng ký ngay',
                  disabled: state.isDisableButtonRegister,
                  backgroundColor: AppColors.textAccent,
                  onTap: () {
                    cubit.createBillBuyCard();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
