import 'package:flutter_prac/controller/user_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/cheetah_api.dart';
import '../model/user.dart';

final channelNameProvider = Provider<String>( // global 변수 or 개체를 위한 일반 provider
      (_) => "provider의 state를 read로 가져옴",
);

final profileNameProvider = FutureProvider<String>((_) => getProfileUserName()); // 바로 반한하므로 await 필요 x

final sessionTimeProvider = StreamProvider.autoDispose<int>((ref) => getSessionTime());

final UserListProvider = StateNotifierProvider<UserListNotifier, List<User>>((ref) {
  return UserListNotifier();
});
