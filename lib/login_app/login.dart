import 'package:flutter/material.dart';
import 'package:flutter_prac/my_button/my_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Sign In',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0.2,
        ),
        body: _buildButton());
    ;
  }
}
// private으로 지정된 _buildButton 메소드는 login.dart file안에서만 접근가능하다

// 반환값이 Padding이어도 되지만 Widget클래스의 하위클래스이므로 Widget으로 해도 상관x  + body뒤에 오는게 위젯이지 꼭 padding만 와야하는건 아니기 때문
Widget _buildButton() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyButton(
            color: Colors.white,
            image: Image.asset('images/glogo.png'),
            onPressed: () {},
            text: Text(
              'Login with Google',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            radius: 4.0),
        SizedBox(
          height: 10.0,
        ),
        MyButton(
            color: Color(0xFF334D92),
            image: Image.asset('images/flogo.png'),
            onPressed: () {},
            text: Text(
              'Login with Facebook',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
            radius: 4.0),
        SizedBox(
          height: 10.0,
        ),
        ButtonTheme(
          height: 50.0,
          child: RaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                Text(
                  'Login with Email',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            color: Colors.green,
            onPressed: () {},
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
      ],
    ),
  );
}
