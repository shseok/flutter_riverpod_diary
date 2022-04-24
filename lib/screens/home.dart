import 'package:flutter/material.dart';
import 'package:flutter_prac/controller/providers.dart';
import 'package:flutter_prac/screens/user_list_screen.dart';

import '../controller/user_list.dart';
import '../model/user.dart';
import '../widget/cheetah_button.dart';
import '../widget/cheetah_input.dart';
import '../widget/user_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String? _name;
  String? _city;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('Home Screen rebuilding...');
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Consumer(builder: (context, ref, child) {
          AsyncValue<String> name = ref.watch(profileNameProvider);

          // return Text( // 다른 방법 : 5초전에 오류가 뜨지만 5초 후에 데이터는 정상적으로 가져온다
          //   name.value!,
          //   style: TextStyle(color: Colors.white),
          // );
          return name.when(
            data: (name) => Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
            loading: () => Container(), // Text(~~~); or loading circle
            error: (e, stackTrace) => Text("Error!!!"),
          );
        }),
        centerTitle: true,
        leading: Center(
          child: Consumer(
            builder: (context, ref, child) {
              AsyncValue<int> time =
                  ref.watch(sessionTimeProvider); // 많은 비동기 시간이 흐를때 stream 유용
              return time.when(
                data: (value) => Text(value.toString()),
                loading: () => Text("?"),
                error: (e, stackTrace) => Text("Error!!!"),
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer(
                builder: (context, ref, child) => Text(
                  ref.watch(channelNameProvider),
                  // Consumer Widget의 ref파라미터를 통한 접근
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'Name',
                onSaved: (String? value) {
                  _name = value;
                },
              ),
              SizedBox(height: 16),
              CheetahInput(
                labelText: 'City',
                onSaved: (String? value) {
                  _city = value;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer(builder: (context, ref, child) {
                    final UserListNotifier controller = ref.watch(
                        UserListProvider
                            .notifier); // 기본적으로 state notifier 객체를 가지고 있다.
                    return CheetahButton(
                      text: 'Add',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;

                        _formKey.currentState!.save();

                        controller.addUser(User(_name, _city));
                      },
                    );
                  }),
                  SizedBox(width: 8),
                  CheetahButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}
