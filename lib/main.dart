import 'package:flutter/material.dart'; // 기본 내장
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_state_provider.dart';

// 등록 후 내장
void main() => runApp(ProviderScope(
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roverpod',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('initial page'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CounterStateProvider();
                      }),
                    );
                  },
                  child:
                      Text('StateProvider', style: TextStyle(fontSize: 18.0)))
            ],
          ),
        ));
  }
}
