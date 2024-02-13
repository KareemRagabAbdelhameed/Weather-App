import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search a City')),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
            onChanged: (data) {
              cityName = data;
            },
            onFieldSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(nameOfCity: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter City Name',
                label: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Search'),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getWeather(nameOfCity: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.search)))),
      )),
    );
  }
}
