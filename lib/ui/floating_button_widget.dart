import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class myFloatingActionButtonWidget extends StatefulWidget {
  final ValueNotifier<bool> isDialOpen;
  late bool rmicons;

  myFloatingActionButtonWidget({Key? key, required this.isDialOpen, required this.rmicons}) : super(key: key);

  @override
  State<myFloatingActionButtonWidget> createState() => _myFloatingActionButtonWidgetState();
}

class _myFloatingActionButtonWidgetState extends State<myFloatingActionButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Color(0xffA876DE),
      // add 0xff to front
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: widget.isDialOpen,
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
          child: !widget.rmicons
              ? const Icon(
            Icons.post_add,
          )
              : null,
          backgroundColor: Colors.white,
          // foregroundColor: Colors.white,
          label: '추가',
          onTap: () => setState(() => widget.rmicons = !widget.rmicons),
          onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: !widget.rmicons
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
          child: !widget.rmicons
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
    );
  }
}
