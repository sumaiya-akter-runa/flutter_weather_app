import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';


class WeatherServices {
  fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat={23.6850}&lon={23.6850}&appid={3ae333652ff187378bb4e67d035e2075}"),
    );

    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
