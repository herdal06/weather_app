import 'package:flutter/material.dart';
import 'widgets/weather_tile.dart';

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
