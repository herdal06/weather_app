import 'package:flutter/material.dart';
import 'widgets/weather_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchWeather() async {
  final zipCode = "06980";
  final apiKey = "6283ba8fed6bd22822d609ef3147b185";
  final requestUrl =
      "https://api.openweathermap.org/data/2.5/weather?zip=${zipCode},tr&appid=${apiKey}";

  final response = await http.get(Uri.parse(requestUrl));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception("Error loading request URL info.")
  }
}

class WeatherInfo {
  final location;
  final temp;
  final tempMin;
  final tempMax;
  final weather;
  final humidity;
  final windSpeed;

  WeatherInfo({
    required this.location, 
    required this.temp, 
    required this.tempMin, 
    required this.tempMax, 
    required this.weather, 
    required this.humidity, 
    required this.windSpeed
  });

  factory WeatherInfo.fromJson(Map<String,dynamic> json) {
    return WeatherInfo(
      location: json['name'], 
      temp: json['main']['temp'], 
      tempMin: json['main']['temp_min'], 
      tempMax: json['main']['temp_max'], 
      weather: json['weather'][0]['description'], 
      humidity: json['main']['humidity'], 
      windSpeed: json['wind']['speed']
    );
  }
}

void main() {
  runApp(MaterialApp(title: "Weather App", home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          color: Color(0xfff1f1f1),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Location',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                "85°",
                style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Text(
              "Hight of 89°, low of 75°",
              style: TextStyle(
                  color: Color(0xff9e9e9e),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600),
            )
          ]),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              WeatherTile(
                  icon: Icons.thermostat_outlined,
                  title: 'Temprature',
                  subtitle: '85°'),
              WeatherTile(
                  icon: Icons.filter_drama_outlined,
                  title: 'Weather',
                  subtitle: 'Cloudy'),
              WeatherTile(
                  icon: Icons.wb_sunny, title: 'Humidity', subtitle: '75%'),
              WeatherTile(
                  icon: Icons.waves_outlined,
                  title: 'Wind Speed',
                  subtitle: '2MPH'),
            ],
          ),
        ))
      ]),
    );
  }
}
