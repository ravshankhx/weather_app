import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/helpers/extensions/extensions.dart';

import '../../data/models/weather.dart';

class CityPart extends StatelessWidget {
  const CityPart({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weather.city.capitalizeString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          weather.desc,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
