import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* Scaffold위젯은 부모의 MyPage 위젯의 context를 물려받음. 하지만, 해당 context는 widget tree 내에서 Scaffold가 어디에 위치하고 있는지의 정보를 가지고 있지 않음.
        Builder위젯 사용 -> 하지만 ScaffoldMessenger로 이를 안써도 됨!
  
      */
        appBar: AppBar(
          title: Text('Snack Bar'),
          centerTitle: true,
        ),
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white, backgroundColor: Colors.red),
            child: Text('Show me'),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Awesome!')));
            },
          ),
        ));
  }
}
