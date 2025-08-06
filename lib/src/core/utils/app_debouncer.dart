// Dart imports:
import 'dart:async';
import 'dart:ui';

// Project imports:
import 'package:xpert_funding_test/src/core/utils/app_loggers.dart';

class Debouncer {
  Debouncer._internal({required this.milliseconds});
  int timesCalled = 0;
  static final Debouncer _instance = Debouncer._internal(
    milliseconds: 1000,
  ); // Initial milliseconds can be adjusted

  factory Debouncer({required int milliseconds}) {
    return _instance;
  }

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      timesCalled++;
      action();
      debugLog('Debouncer: $timesCalled');
    });
  }

  void cancel() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
