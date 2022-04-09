import 'package:flutter/material.dart'; // 기본 내장
import 'package:flutter_prac/ScreenA.dart';
import 'package:flutter_prac/ScreenB.dart';
import 'package:flutter_prac/ScreenC.dart';

// 등록 후 내장
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      initialRoute: '/', // home -> intialRoute 변경때문에 restart
      routes: {
        '/': (context) => ScreenA(),
        '/b': (context) => ScreenB(),
        '/c': (context) => ScreenC(),
      },
    );
  }
}
