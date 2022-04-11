import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/* 
StatefulWidget 위 패키지에서 제공된다.
*/

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

// createState method는 StatefulWidget 생성될때마다 호출되는 method이며 State<MyApp>타입으로 생성한 객체를 반환한다.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('버튼을 눌러보고 결과를 확인해보세요'),
                SizedBox(height: 20),
                // dirty
                Text(
                  '$counter',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          // 버튼 누를시 setState 호출 -> 숫자 증가에 따라 counter를 사용하고 있는 위젯 표시 (변화에 반응하여 rebuild해야하기 때문)
                          // setState가 표시해주는 위젯 = dirty
                          setState(() {
                            counter++;
                            print("$counter");
                          });
                        }),
                    SizedBox(
                      width: 30,
                    ),
                    FloatingActionButton(
                        child: Icon(Icons.remove),
                        onPressed: () {
                          // 버튼 누를시 setState 호출 -> 숫자 증가에 따라 counter를 사용하고 있는 위젯 표시 (변화에 반응하여 rebuild해야하기 때문)
                          // setState가 표시해주는 위젯 = dirty
                          setState(() {
                            counter--;
                            print("$counter");
                          });
                        }),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
