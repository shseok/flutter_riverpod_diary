// http 요청시 들어온 데이터 저장할 때 사용할 클래스
class Info {
  final int id;
  final String userName;
  final int account;
  final int balance;

  Info(
      {required this.id,
      required this.userName,
      required this.account,
      required this.balance});

// 개발자가 Info 클래스를 통해 직접 instance를 만드는게 아니라 arguments를 통해서 json data가 넘어오면 자신이 알아서 Info 클래스의 instance를 만들어서 return해주는 역할
  factory Info.fromJson(Map<dynamic, dynamic> json) {
    return Info(
      id: json['id'],
      userName: json['userName'],
      account: json['account'],
      balance: json['balance'],
    );
  }
}
