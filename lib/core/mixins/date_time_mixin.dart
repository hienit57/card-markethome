mixin DateTimeMixin {
  static int get timestamp => DateTime.now().millisecondsSinceEpoch ~/ 1000;

  static String secondsToHHMM(int totalSeconds) {
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  static String secondsToMMSS(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static String secondsToSS(int totalSeconds) {
    final int seconds = totalSeconds <= 0 ? 0 : totalSeconds -= 1;
    return seconds.toString().padLeft(totalSeconds <= 10 ? 1 : 2, '0');
  }
}
