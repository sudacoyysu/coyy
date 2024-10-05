import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di sudut kanan atas
      title: 'AccuWeather Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherScreen(), // Memanggil tampilan utama yaitu WeatherScreen
    );
  }
}
