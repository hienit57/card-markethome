import 'package:card_markethome/index.dart';

class CardRegisterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onSendReview;

  const CardRegisterAppBar({
    super.key,
    this.onSendReview,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40),
      child: BlocBuilder<CardRegisterCubit, CardRegisterState>(
        buildWhen: (previous, current) =>
            previous.currentStep != current.currentStep,
        builder: (context, state) {
          return BaseAppBar(
            title: 'Đăng ký',
            backgroundColor: AppColors.colorE4F4FF,
            isBack: true,
            onBack: () {
              if (state.currentStep == RegisterStepEnum.step1 ||
                  state.currentStep == RegisterStepEnum.step3) {
                Navigation.pop(context);
              } else if (state.currentStep == RegisterStepEnum.step2) {
                context.read<CardRegisterCubit>().setCurrentStep(
                      RegisterStepEnum.step1,
                    );
              }
            },
          );
        },
      ),
    );
  }

  static final AppBar _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
