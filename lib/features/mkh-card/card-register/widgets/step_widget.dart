import 'package:card_markethome/index.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CardRegisterCubit>();
    return BlocBuilder<CardRegisterCubit, CardRegisterState>(
      buildWhen: (previous, current) =>
          previous.currentStep != current.currentStep ||
          previous.isDisableButtonRegister != current.isDisableButtonRegister ||
          previous.onCreateBillBuyCard != current.onCreateBillBuyCard,
      builder: (context, state) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              _StepNumberWidget(
                stepNumber: RegisterStepEnum.step1.stepNumber,
                title: RegisterStepEnum.step1.title,
                isSelected: state.currentStep.stepNumber >= 1,
                isPassed: state.currentStep.stepNumber > 1,
                onTap: () {
                  if (state.currentStep.stepNumber == 2) {
                    cubit.setCurrentStep(RegisterStepEnum.step1);
                  }
                },
              ),
              _DividerStep(isActive: state.currentStep.stepNumber >= 2),
              _StepNumberWidget(
                stepNumber: RegisterStepEnum.step2.stepNumber,
                title: RegisterStepEnum.step2.title,
                isSelected: state.currentStep.stepNumber >= 2,
                isPassed: state.currentStep.stepNumber > 2,
                onTap: () {
                  final canClickStep = !state.isDisableButtonRegister &&
                      state.currentStep.stepNumber == 1 &&
                      state.onCreateBillBuyCard ==
                          FormzSubmissionStatus.success;
                  if (canClickStep) {
                    cubit.setCurrentStep(RegisterStepEnum.step2);
                  }
                },
              ),
              _DividerStep(isActive: state.currentStep.stepNumber >= 3),
              _StepNumberWidget(
                stepNumber: RegisterStepEnum.step3.stepNumber,
                title: RegisterStepEnum.step3.title,
                isSelected: state.currentStep.stepNumber >= 3,
                isPassed: state.currentStep.stepNumber > 3,
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DividerStep extends StatelessWidget {
  final bool isActive;

  const _DividerStep({required this.isActive});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          height: 1,
          color: isActive ? AppColors.blue4291EB : AppColors.blueEBEBEB,
          margin: const EdgeInsets.only(bottom: 24),
        ),
      );
}

class _StepNumberWidget extends StatelessWidget {
  final int stepNumber;
  final String title;
  final bool isSelected;
  final bool isPassed;
  final Function onTap;

  const _StepNumberWidget({
    required this.stepNumber,
    required this.title,
    required this.isSelected,
    required this.isPassed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: isSelected || isPassed
                  ? AppColors.blueBEE0FF
                  : AppColors.blueEBEBEB,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: isPassed
                    ? AppColors.color90BEF1
                    : isSelected
                        ? AppColors.blue4291EB
                        : AppColors.colorCACACA,
                child: Text(
                  '$stepNumber',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: context.text.titleSmall?.copyWith(
                fontSize: 12,
                color: isPassed
                    ? AppColors.color4B4B4B
                    : isSelected
                        ? Colors.blue
                        : AppColors.color4B4B4B,
                fontWeight: isSelected || isPassed
                    ? FontWeight.w500
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
