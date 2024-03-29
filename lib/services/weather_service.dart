import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'd7c954c8ccca411889f124327231509';
  Future<WeatherModel?> getWeather({required String nameOfCity}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$nameOfCity&days=1');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromjson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
