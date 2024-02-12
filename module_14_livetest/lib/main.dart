import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:module_14_livetest/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String jsonTexts = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Weather> weatherData = _weatherData(jsonTexts);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          title: const Text(
            'Weather Information',
          ),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            Weather weather = weatherData[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!),
              ),
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                title: Text(
                  'City: ${weather.city}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temperature: ${weather.temperature}°C',
                      style: _itemTextStyle(),
                    ),
                    Text('Condition: ${weather.condition}',
                        style: _itemTextStyle()),
                    Text('Humidity: ${weather.humidity}%',
                        style: _itemTextStyle()),
                    Text('Wind Speed: ${weather.windSpeed} m/s',
                        style: _itemTextStyle()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  TextStyle _itemTextStyle() {
    return TextStyle(
      fontSize: 16.0,
      color: Colors.grey[600],
      fontWeight: FontWeight.normal,
    );
  }

  List<Weather> _weatherData(String jsonParse) {
    List<dynamic> jsonData = json.decode(jsonParse);
    List<Weather> weatherData = jsonData.map((item) {
      return Weather(
        city: item['city'],
        temperature: item['temperature'],
        condition: item['condition'],
        humidity: item['humidity'],
        windSpeed: item['windSpeed'],
      );
    }).toList();
    return weatherData;
  }
}
