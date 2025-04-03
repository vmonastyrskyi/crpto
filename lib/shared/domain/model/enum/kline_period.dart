enum KlinePeriod {
  oneHour(duration: Duration(hours: 1), name: '1H'),
  oneDay(duration: Duration(days: 1), name: '1D'),
  oneWeek(duration: Duration(days: 7), name: '1W'),
  oneMonth(duration: Duration(days: 30), name: '1M'),
  oneYear(duration: Duration(days: 365), name: '1Y'),
  allTime(duration: Duration(days: 365 * 24), name: 'All');

  const KlinePeriod({required this.duration, required this.name});

  final Duration duration;
  final String name;
}
