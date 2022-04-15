import 'package:flutter/material.dart';
import 'package:flutter_prac/info.dart';
import 'package:http/http.dart' as http; // 웹상에서 정보를 끌어오기 위한 라이브러리
import 'dart:async'; // async await 라이브러리(설치x해도 됨)
import 'dart:convert'; // json 데이터 변환용 라이브러리

// 등록 후 내장
void main() => runApp(MyApp(info: fetchInfo()));

class MyApp extends StatelessWidget {
  final Future<Info> info;
  const MyApp({required this.info, Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('계좌 정보 확인하기'),
            centerTitle: true,
          ),
          body: Center(
            child: FutureBuilder<Info>(
              // data를 다 받아오기 전에 그릴 수 있는 곳은 그리기 위해쓰임
              future: info,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('고객 번호: ' + snapshot.data!.id.toString(),
                          style: const TextStyle(fontSize: 20.0)),
                      Text('고객명: ' + snapshot.data!.userName.toString(),
                          style: const TextStyle(fontSize: 20.0)),
                      Text('계좌 아이디: ' + snapshot.data!.account.toString(),
                          style: const TextStyle(fontSize: 20.0)),
                      Text('잔액: ' + snapshot.data!.balance.toString() + '원',
                          style: const TextStyle(fontSize: 20.0))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator(); // 데이터 수신이 끝나기 전에 나타나는 코드
              },
            ),
          )),
    );
  }
}

Future<Info> fetchInfo() async {
  final response = await http
      .get(Uri.parse('https://my.api.mockaroo.com/bank.json?key=79f4eaf0'));

  if (response.statusCode == 200) {
    // http 상태 정상 / 서버측 요청 정상처리
    print(response.body); // json.decode = jsonDecode
    print(jsonDecode(response.body));
    return Info.fromJson(json.decode(response.body)[0]);
  } else {
    throw Exception('실패했습니다.');
  }
}
