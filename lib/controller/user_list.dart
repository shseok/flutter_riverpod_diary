import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user.dart';

class UserListNotifier extends StateNotifier<List<User>> { // 실제 데이터를 갖는곳
  // UserListNotifier() : super([]);
  UserListNotifier([List<User>? state]) : super([]); // 초기 state를 빈 배열로 할당
  // UserListNotifier(List<User> state) : super(state); // notifierProvider에서 초기값으로 List를 받아옴

  addUser(User user){
    state = [...state, user];
  }

  deleteUser(User user){
    state = state.where((_user) => _user.name != user.name).toList();
  }

}