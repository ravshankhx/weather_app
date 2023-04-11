import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubits/weather/weather_cubit.dart';
import 'package:weather_app/presentation/screens/search_screen.dart';

import '../widgets/city_part.dart';
import '../widgets/temperature.dart';
import '../widgets/weather_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getWeather('london');
  }

  void _getWeather(String city) {
    context.read<WeatherCubit>().getWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (ctx, state) {
          if (state is WeatherError) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Error'),
                content: Text(state.message),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Ok"))
                ],
              ),
            );
            if (state.message.toLowerCase().contains('not found')) {
              _getWeather('london');
            }
          }
        },
        builder: (ctx, state) {
          if (state is WeatherInitial) {
            return Center(
              child: Text("Select a city"),
            );
          }
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is WeatherLoaded) {
            final weather = state.weather;

            final mainWeather = weather.main.toLowerCase();
            String imagePath = '';

            if (mainWeather.contains('rain')) {
              imagePath = 'assets/rainy.jpg';
            } else if (mainWeather.contains('sun')) {
              imagePath = 'assets/rainy.jpg';
            } else if (mainWeather.contains('cloud')) {
              imagePath = 'assets/rainy.jpg';
            } else {
              imagePath = 'assets/rainy.jpg';
            }

            return Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.black.withOpacity(0.2),
                ),

                WeatherMenu(getWeather: _getWeather,),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CityPart(weather: weather),
                        Temperature(weather: weather)
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
