enum KlineInterval {
  oneSecond(value: '1s'),
  oneMinute(value: '1m'),
  threeMinutes(value: '3m'),
  fiveMinutes(value: '5m'),
  fifteenMinutes(value: '15m'),
  thirtyMinutes(value: '30m'),
  oneHour(value: '1h'),
  twoHours(value: '2h'),
  fourHours(value: '4h'),
  sixHours(value: '6h'),
  eightHours(value: '8h'),
  twelveHours(value: '12h'),
  oneDay(value: '1d'),
  threeDays(value: '3d'),
  oneWeek(value: '1w'),
  oneMonth(value: '1M');

  const KlineInterval({required this.value});

  final String value;
}
