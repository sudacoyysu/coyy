import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InpoCuacaLek'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'Enter city name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                weatherController.fetchWeather(cityController.text);
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 30),
            Obx(() {
              if (weatherController.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                final weather = weatherController.weather.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      weather.cityName,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${weather.temperature.toStringAsFixed(2)}°C',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      weather.description,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.water_drop_outlined, size: 30),
                            SizedBox(height: 5),
                            Text(
                              '${weather.humidity}%',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text('Humidity'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.air, size: 30),
                            SizedBox(height: 5),
                            Text(
                              '${weather.windSpeed.toStringAsFixed(2)} m/s',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text('Wind Speed'),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
