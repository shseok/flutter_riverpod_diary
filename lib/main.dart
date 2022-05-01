import 'package:flutter/material.dart'; // 기본 내장
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

// 등록 후 내장
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'initial page',
      theme: ThemeData(primaryColor: Color(0xffA876DE)),
      home: MyPage(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ko', 'KR')],
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  DateTime? date;
  final today = DateTime.now().add(const Duration(hours: 9));

  String getText() {
    if (date == null) {
      return '${'${today.year}/${today.month}/${today.day}'}';
    } else {
      return '${'${date!.year}/${date!.month}/${date!.day}'}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('initial page'),
          centerTitle: true,
        ),
        body: Center(
          child: DecoratedBox(
              child: TextButton(
                child: Text(getText(), style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w400)),
                onPressed: () => pickDate(context),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              )),
        ));
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now().add(const Duration(hours: 9));
    final newDate = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        helpText: '',
        initialDate: initialDate,
        // date ?? initialDate,
        firstDate: DateTime(initialDate.year - 5),
        lastDate: DateTime(initialDate.year + 5),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xffA876DE),
                  onPrimary: Colors.white,
                  surface: Color(0xffA876DE),
                  onSurface: Colors.black,
                ),
                dialogTheme: DialogTheme(),
              ),
              child: child!,
            ));
    if (newDate == null) return; // 취소 버튼 클릭

    setState(() {
      date = newDate;
    });
  }
}
