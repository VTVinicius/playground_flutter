import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'di/setup_get_it.dart';

class UserActivityNotifier extends ChangeNotifier {
  DateTime _lastInteraction = DateTime.now();

  UserActivityNotifier() {
    _lastInteraction = DateTime.now();
    _startTimer();
    print("refreshLastInteraction: $_lastInteraction");
  }

  void refreshLastInteraction() {
    _lastInteraction = DateTime.now();
    print("refreshLastInteraction: $_lastInteraction");
    notifyListeners();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      if (DateTime.now().difference(_lastInteraction) >= Duration(minutes: 2)) {
        timer.cancel();
        print("refreshLastInteraction: $_lastInteraction");
      }
    });
  }
}


class UserInteractionObserver extends RouteAware with WidgetsBindingObserver {
  @override
  void didPush() {
    _refreshLastInteraction();
    super.didPush();
  }

  @override
  void didPop() {
    _refreshLastInteraction();
    super.didPop();
  }

  @override
  void didChangeMetrics() {
    _refreshLastInteraction();
    super.didChangeMetrics();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _refreshLastInteraction();
    super.didChangeAppLifecycleState(state);
  }

  void _refreshLastInteraction() {
    var viewModel = getIt.get<UserActivityNotifier>();
    viewModel.refreshLastInteraction();
  }
}