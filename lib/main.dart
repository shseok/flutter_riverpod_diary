import 'package:flutter/material.dart'; // 기본 내장
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// 등록 후 내장
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'initial page',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  var rmicons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('initial page'),
        centerTitle: true,
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Color(0xffA876DE),
        // add 0xff to front
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        openCloseDial: isDialOpen,
        buttonSize: const Size(56.0, 56.0),
        childrenButtonSize: const Size(56.0, 56.0),
        visible: true,
        direction: SpeedDialDirection.up,
        renderOverlay: true,
        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        elevation: 8.0,
        isOpenOnStart: false,
        animationSpeed: 150,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child: !rmicons
                ? const Icon(
                    Icons.post_add,
                  )
                : null,
            backgroundColor: Colors.white,
            // foregroundColor: Colors.white,
            label: '추가',
            onTap: () => setState(() => rmicons = !rmicons),
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: !rmicons
                ? const Icon(
                    Icons.delete_outline,
                  )
                : null,
            backgroundColor: Colors.white,
            // foregroundColor: Colors.white,
            label: '삭제',
            onTap: () => debugPrint('SECOND CHILD'),
          ),
          SpeedDialChild(
            child: !rmicons
                ? const Icon(
                    Icons.edit_note,
                  )
                : null,
            backgroundColor: Colors.white,
            // foregroundColor: Colors.white,
            label: '수정',
            visible: true,
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(("Third Child Pressed")))),
            onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
          ),
        ],
      ),
    );
  }
}
