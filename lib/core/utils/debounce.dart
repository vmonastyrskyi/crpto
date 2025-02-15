import 'dart:async';

import 'package:flutter/foundation.dart';

class Debounce {
  _DebounceTask? _task;

  void call(
    VoidCallback callback,
    Duration duration,
  ) {
    if (duration == Duration.zero) {
      _task?.timer.cancel();
      callback();
    } else {
      _task?.timer.cancel();
      _task = _DebounceTask(
        callback,
        Timer(
          duration,
          () {
            _task?.timer.cancel();
            callback();
          },
        ),
      );
    }
  }

  void fire() {
    _task?.timer.cancel();
    _task?.callback();
    _task = null;
  }

  void cancel() {
    _task?.timer.cancel();
    _task = null;
  }
}

class _DebounceTask {
  const _DebounceTask(this.callback, this.timer);

  final VoidCallback callback;
  final Timer timer;
}
