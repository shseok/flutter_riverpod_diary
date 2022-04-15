import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() { // Loading statefulWidget 생성시 한번만 실행되는 메소드
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async{
    http.Response response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    if(response.statusCode == 200){
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData);
      // print(jsonData['weather'][0]['description']);
      print(myJson);
      print(myJson['weather'][0]['description']);

    }
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
