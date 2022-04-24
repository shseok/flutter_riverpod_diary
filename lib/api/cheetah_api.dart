import 'dart:async';

Future<String> getProfileUserName() async {
  await Future.delayed(Duration(seconds: 5));

  return "비동기로 5초 후 가져온 데이터";
}

Future<String> getCountry() async {
  await Future.delayed(Duration(seconds: 5));

  return "비동기로 5초 후 가져온 데이터";
}

Stream<int> getSessionTime() {
  return Stream.periodic(Duration(seconds: 1), (sessionTime) => sessionTime++);
}