class ClockState {
  double seconds;
  double minutes;
  double hours;

  ClockState({
    required this.seconds,
    required this.minutes,
    required this.hours,
  });

  ClockState copyWith({
    required double seconds,
    required double minutes,
    required double hours,
  }) {
    return ClockState(
      seconds: seconds ?? this.seconds,
      minutes: minutes ?? this.minutes,
      hours: hours ?? this.hours,
    );
  }
}
