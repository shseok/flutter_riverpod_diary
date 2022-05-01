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

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('initial page'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('클릭'),
            onPressed: () {
              showDatePicker(
                  initialEntryMode : DatePickerEntryMode.calendarOnly,
                  context: context,
                  helpText: '',
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2025),
                  builder: (context, child) =>
                      Theme(
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
                      )
              );
            },
          ),
        ));
  }
}
