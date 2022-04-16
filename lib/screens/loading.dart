import 'package:flutter/material.dart';
import 'package:flutter_prac/data/my_location.dart';
import 'package:flutter_prac/data/network.dart';
import 'package:flutter_prac/screens/weather_screen.dart';
import 'package:geolocator/geolocator.dart';

const apiKey = '8956debb3725873aa29cca6628a27a28';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // Loading statefulWidget 생성시 한번만 실행되는 메소드
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getLocation();
    // print(jsonData['weather'][0]['description']);
    // print(myJson['weather'][0]['description']);
    NetWork netWork = NetWork(
        'https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.latitude2}&lon=${myLocation.logitude2}&appid=$apiKey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=${myLocation.latitude2}&lon=${myLocation.logitude2}&appid=$apiKey');

    var weatherData = await netWork.getJsonData();
    print(weatherData);
    var airData = await netWork.getAirData();
    print(airData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPollution: airData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Get my location', style: TextStyle(color: Colors.white)),
      ),
    ));
  }
}
