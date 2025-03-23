import 'package:card_markethome/index.dart';

enum RegisterStepEnum {
  step1,
  step2,
  step3,
}

extension RegisterStepEnumExtension on RegisterStepEnum {
  String get title {
    switch (this) {
      case RegisterStepEnum.step1:
        return S.current.infomation;
      case RegisterStepEnum.step2:
        return S.current.confirm;
      case RegisterStepEnum.step3:
        return S.current.payment;
    }
  }

  int get stepNumber {
    switch (this) {
      case RegisterStepEnum.step1:
        return 1;
      case RegisterStepEnum.step2:
        return 2;
      case RegisterStepEnum.step3:
        return 3;
    }
  }
}
