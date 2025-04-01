enum KlineInterval {
  oneSecond(duration: Duration(seconds: 1), value: '1s'),
  oneMinute(duration: Duration(minutes: 1), value: '1m'),
  threeMinutes(duration: Duration(minutes: 3), value: '3m'),
  fiveMinutes(duration: Duration(minutes: 5), value: '5m'),
  fifteenMinutes(duration: Duration(minutes: 15), value: '15m'),
  thirtyMinutes(duration: Duration(minutes: 30), value: '30m'),
  oneHour(duration: Duration(hours: 1), value: '1h'),
  twoHours(duration: Duration(hours: 2), value: '2h'),
  fourHours(duration: Duration(hours: 4), value: '4h'),
  sixHours(duration: Duration(hours: 6), value: '6h'),
  eightHours(duration: Duration(hours: 8), value: '8h'),
  twelveHours(duration: Duration(hours: 12), value: '12h'),
  oneDay(duration: Duration(days: 1), value: '1d'),
  threeDays(duration: Duration(days: 3), value: '3d'),
  oneWeek(duration: Duration(days: 7), value: '1w'),
  oneMonth(duration: Duration(days: 30), value: '1M');

  const KlineInterval({required this.duration, required this.value});

  final Duration duration;
  final String value;
}
