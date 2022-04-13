import 'package:flutter/material.dart';

// 생성자를 통해 statelesswidget에 새로운 값들이 들어온다면 statelesswidget의 build method들이 rebuild되는 과정에서 변수들도 새로운 값이 적용된다.
class MyButton extends StatelessWidget {
  final Widget image;
  final Widget text;
  final Color color;
  final VoidCallback onPressed;
  final double radius;

  MyButton(
      {required this.color,
      required this.image,
      required this.onPressed,
      required this.text,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            image,
            text,
            Opacity(
              opacity: 0.0,
              child: Image.asset('images/glogo.png'),
            ),
          ],
        ),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        onPressed: onPressed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}
