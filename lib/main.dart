import 'package:flutter/material.dart';
import 'package:flutter_prac/dice.dart'; // 기본 내장

// 등록 후 내장
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

// 입력되는 값이 있기때문에 statefulWidget으로
class _LogInState extends State<LogIn> {
  // TextField에 있는 값을 가져오기 위함
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //ScaffoldMessenger.of 메서드 에서 찾은 가장 가까운 Scaffold를 찾아서 반환
        appBar: AppBar(
          title: Text('Log in'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context)
                  .unfocus(); // Scaffold.of가 아니기 때문에 Builder 위젯이 필요없는 건가?
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(
                      image: AssetImage('images/chef.gif'),
                      width: 170.0,
                    ),
                  ),
                  Form(
                      child: Theme(
                    data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.teal, fontSize: 15.0))),
                    child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              decoration:
                                  InputDecoration(labelText: 'Enter "dice"'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: controller2,
                              decoration: InputDecoration(
                                  labelText: 'Enter "Password"'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(height: 40.0),
                            ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (controller.text == 'dice' &&
                                          controller2.text == '1234') {
                                        Navigator.push(
                                            context, // context : widget tree의 위치정보에 근거하여 현재 화면()상의 페이지가 어떤 페이지인지 확인 후 이후의 페이지를 쌓아올려야하기 때문
                                            MaterialPageRoute(
                                                // 아래의 매개변수인 context는 현재는 사용되지 않음을 알 수 있다.
                                                builder:
                                                    (BuildContext context) =>
                                                        Dice()));
                                      } else if (controller.text != 'dice' &&
                                          controller2.text == '1234') {
                                        showSnackBar3(context);
                                      } else if (controller.text == 'dice' &&
                                          controller2.text != '1234') {
                                        showSnackBar2(context);
                                      } else {
                                        showSnackBar(context);
                                      }
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.orangeAccent))))
                          ],
                        )),
                  ))
                ],
              ),
            )));
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //ScaffoldMessenger.of 메서드 -> 가장 가까운 ScaffoldMessenger를 찾아서 반환하라 라는 뜻
    content: Text(
      '로그인 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.redAccent,
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호가 일치하지 않습니다.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.redAccent,
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      'dice의 철자를 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.redAccent,
  ));
}
