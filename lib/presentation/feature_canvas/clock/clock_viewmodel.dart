import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:playground_flutter/core/base_response.dart';

import 'clock_state.dart';

class ClockViewModel extends ChangeNotifier {
  final ValueNotifier<ClockState> _state =
      ValueNotifier<ClockState>(ClockState(seconds: DateTime.now().second.toDouble(), minutes: DateTime.now().minute.toDouble(), hours: DateTime.now().hour.toDouble()));

  ValueNotifier<ClockState> get state => _state;

  ClockViewModel();

  void runClock() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      _state.updateState((clockState) => clockState.copyWith(
          seconds: now.second.toDouble(),
          minutes: now.minute.toDouble() + now.second / 60,
          hours: now.hour.toDouble() + now.minute / 60));
      notifyListeners();
    });
  }
}
