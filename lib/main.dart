import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DateTimePicker Demo',
      home: MyHomePage(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ko', 'KR')], //, Locale('pt', 'BR')],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _controller3;

  //String _initialValue = '';
  String _valueChanged3 = '';

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'ko_KR';
    //_initialValue = DateTime.now().toString();
    _controller3 = TextEditingController(text: DateTime.now().toString());

    _getValue();
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = '2000-10-22 14:30';
        _controller3.text = '${getToday()}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter DateTimePicker Demo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _oFormKey,
          child: Column(
            children: <Widget>[
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'yyyy/MM/dd',
                controller: _controller3,
                //initialValue: _initialValue,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: '',
                locale: Locale('ko', 'KR'),
                onChanged: (val) => setState(() => _valueChanged3 = val),
              ),
              SizedBox(height: 20),
              Text(
                'DateTimePicker data value onChanged:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SelectableText(_valueChanged3),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final loForm = _oFormKey.currentState;

                  if (loForm?.validate() == true) {
                    loForm?.save();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final loForm = _oFormKey.currentState;
                  loForm?.reset();

                  setState(() {
                    _valueChanged3 = '';
                  });
                  _controller3.clear();
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getToday(){
  final now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String strToday = formatter.format(now);
  return strToday;
}