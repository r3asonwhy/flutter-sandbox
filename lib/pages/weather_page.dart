import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/models/weather_model.dart';
import 'package:myapp/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService(dotenv.env['WEATHER_API_KEY'] ?? '');

  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  String getWeatherAnimation(String? condition) {
    if (condition == null) return 'sunny';
    switch (condition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'cloud';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'rain';
      case 'thunderstorm':
        return 'thunder';
      case 'clear':
        return 'sunny';
      default:
        return 'sunny';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.location_on),
                Text(_weather?.cityName ?? "Loading city.."),
              ],
            ),
            Lottie.asset(
              'assets/${getWeatherAnimation(_weather?.mainCondition)}.json',
            ),
            Text(
              '${_weather?.temperature.round()}°',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
