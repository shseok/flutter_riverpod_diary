import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_prac/controller/user_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/providers.dart';
import '../model/user.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final userList = ref.watch(UserListProvider);
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Card(
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${userList[index].name}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'City: ${userList[index].city}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      UserListNotifier controller = ref.read(UserListProvider.notifier);
                      controller.deleteUser(userList[index]);
                    },
                  )
                ],
              ),
            ),
          ),
          itemCount: userList.length,
        );
      },
    );
  }
}