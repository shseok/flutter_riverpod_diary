import 'package:flutter/material.dart';
import 'package:flutter_prac/provider/bottom_navigation_provider.dart';
import 'package:flutter_prac/provider/count_provider.dart';
import 'package:flutter_prac/src/home.dart'; // 기본 내장
import 'package:provider/provider.dart';
// 등록 후 내장
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [ // 두개의 provider룰 추가하여 child인 Home에서 접근 및 제어 가능
        ChangeNotifierProvider(create: (BuildContext context) => CountProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => BottomNavigationProvider()),
      ],
      child: Home()),
    );
  }
}