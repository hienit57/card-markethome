import 'package:card_markethome/index.dart';

mixin TimerMixin<T extends StatefulWidget> on State<T> {
  bool get isCountDown;
  int get timeInputLimit;
  bool get runBackground => true;
  Duration get loopTime => const Duration(seconds: 1);
  void onCompleteTimer();

  late ValueNotifier<int> timeCtr;
  late Timer _timer;
  bool _isStart = false;
  int? _time;

  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  @override
  void dispose() {
    if (_isStart) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _setTimer() {
    _time = DateTimeMixin.timestamp + timeInputLimit;
    timeCtr = ValueNotifier<int>(
      isCountDown && _time != null ? timeInputLimit : 0,
    );
  }

  void startTimer() {
    _isStart = true;
    if (isCountDown && _time != null) {
      _startCountDownTimer();
    } else {
      _startCountUpTimer();
    }
  }

  void _startCountDownTimer() {
    _timer = Timer.periodic(loopTime, (timer) {
      if (timeCtr.value <= 0) {
        timer.cancel();
        onCompleteTimer();
      } else {
        timeCtr.value--;
      }
    });
  }

  void _startCountUpTimer() {
    _timer = Timer.periodic(loopTime, (timer) {
      final ti = _time;
      if (ti != null) {
        timeCtr.value = (DateTimeMixin.timestamp - ti) + 1;
      }
    });
  }

  /// Time interval to call function at interval
  int get timeInterval => 10;

  void executeFunctionAtInterval() {
    _timer = Timer.periodic(Duration(seconds: timeInterval), (timer) {
      if (timeCtr.value <= 0) {
        timer.cancel();
      } else {
        functionAtInterval();
      }
    });
  }

  void functionAtInterval() {}

  ///

  void restartTimer() {
    _setTimer();
    startTimer();
  }

  Widget builderTimer(ValueWidgetBuilder<int> builder) {
    return ValueListenableBuilder<int>(
      valueListenable: timeCtr,
      builder: builder,
    );
  }
}
