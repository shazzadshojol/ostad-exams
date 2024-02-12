// {
// "city": "New York",
// "temperature": 20,
// "condition": "Clear",
// "humidity": 60,
// "windSpeed": 5.5
// },

class Weather {
  final String city;
  final int temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });
}
