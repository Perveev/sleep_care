import 'dart:async';

class Ticker {
  static const _second = Duration(seconds: 1);

  Timer? _timer;

  final int startTime;
  final void Function(int) onTick;
  final void Function() onEnd;
  late int _time;

  Ticker({
    required this.startTime,
    required this.onTick,
    required this.onEnd,
  });

  void start() {
    _time = startTime;
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(_second, (timer) {
      if (_time == 1) {
        timer.cancel();
        onEnd();
      } else {
        _time--;
        onTick(_time);
      }
    });
  }

  void cancel() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
  }
}
