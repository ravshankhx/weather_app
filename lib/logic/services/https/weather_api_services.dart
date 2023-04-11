import 'dart:convert';

import 'package:weather_app/logic/services/exceptions/weather_exceptions.dart';

import '../../../data/constants/constants.dart';
import '../../../data/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiServices {
  final http.Client client;

  WeatherApiServices({required this.client});

  Future<Weather> getWeather(String city) async {
    final url = Uri.parse('$base_url?q=${city.toLowerCase()}&appid=${api_key}');

    try {
      final response = await client.get(url);

      print(response);
      if (response.statusCode >= 400) {
        throw Exception(response.reasonPhrase);
      }
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      if (responseBody == null) {
        throw WeatherExceptions('Cannot get weather for $city');
      }

      final data = responseBody as Map<String, dynamic>;

      print("data ${data}");
      final weatherData = data['weather'][0];
      final mainData = data['main'];
      print(" weather ${weatherData}");
      print(mainData);
      final Weather weather = Weather(
        id: weatherData['id'].toString(),
        main: weatherData['main'],
        desc: weatherData['description'],
        icon: weatherData['icon'],
        temperature: double.parse(mainData['temp'].toString()),
        city: city,
      );
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
