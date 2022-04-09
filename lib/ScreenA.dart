import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ScreenA')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: Text('Go to the ScreenB'),
                  onPressed: () {
                    // pushNamed : 각 페이지 별 이름을 통해 위젯을 빌드 후 push하기 때문에 쓰인다.
                    Navigator.pushNamed(context, '/b');
                  }),
              ElevatedButton(
                  child: Text('Go to the ScreenC'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/c');
                  })
            ],
          ),
        ));
  }
}
