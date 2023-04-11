class Weather {
  final String id;
  final String main;
  final String desc;

  final String icon;
  final String city;
  final double temperature;

  Weather({
    required this.id,
    required this.main,
    required this.desc,
    required this.icon,
    required this.temperature,
    required this.city,
  });
}
