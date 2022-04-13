import 'package:flutter/material.dart';
import 'package:flutter_prac/login_app/login.dart'; // 기본 내장

// 등록 후 내장
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login app',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Login(),
    );
  }
}
