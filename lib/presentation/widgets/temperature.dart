

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/helpers/extensions/extensions.dart';

import '../../data/models/weather.dart';

class Temperature extends StatelessWidget {
  const Temperature({
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
          "${weather.temperature.toStringAsFixed(0)} C",
          style: TextStyle(
              height: 0.1,

              color: Colors.white,
              fontSize: 70,
              fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png',),
            Text(
              weather.main,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),

      ],
    );
  }
}