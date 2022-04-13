import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: Text('Dice game'),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(child: Image.asset('images/dice$leftDice.png')),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: Image.asset('images/dice$rightDice.png'))
                ],
              ),
            ),
            ButtonTheme(
                minWidth: 100.0,
                height: 60.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orangeAccent)),
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                      rightDice = Random().nextInt(6) + 1;
                      showToast("Left: {$leftDice}, Right: {$rightDice}");
                    });
                  },
                  child:
                      Icon(Icons.play_arrow, color: Colors.white, size: 50.0),
                ))
          ]),
        ));
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      textColor: Colors.black,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
