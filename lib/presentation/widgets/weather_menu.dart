

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class WeatherMenu extends StatelessWidget {
  const WeatherMenu({
    super.key, required this.getWeather,
  });
  final Function getWeather;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Positioned(
          right: 0,
          top: 40,
          child: IconButton(
            onPressed: () async {
              final _city = await Navigator.of(context)
                  .pushNamed(SearchScreen.routeName);
              print(_city);
              if (_city != null) {
                getWeather(_city as String);
              }
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.settings))


      ],
    );
  }
}
