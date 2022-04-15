import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;
  const WeatherScreen({Key? key, this.parseWeatherData}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late double tmpTemp;
  late int temp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData); // widget.  ???
  }

  void updateData(dynamic weatherData){
    tmpTemp = weatherData['main']['temp'];
    temp = tmpTemp.round();
    cityName = weatherData['name'];
    print(temp);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$cityName', style: TextStyle(fontSize:30.0)),
              SizedBox(height: 20.0),
              Text('$temp', style: TextStyle(fontSize:30.0)),
            ],
          ),
        ),
      )
    );
  }
}
