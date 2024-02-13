import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Center(
        child: weatherData == null
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(
                      'there is no weather start',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      'searching now',
                      style: TextStyle(fontSize: 30),
                    ),
                  ])
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[50]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    weatherData!.name,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Updated at : ${weatherData!.date}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Image.asset(weatherData!.getImage()),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        weatherData!.temp.toInt().toString(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            'Max: ${weatherData!.maxTemp.toInt()}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Min: ${weatherData!.minTemp.toInt()}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    weatherData?.weatherStateName ?? '',
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 9,
                  ),
                ]),
              ),
      ),
    );
  }
}
