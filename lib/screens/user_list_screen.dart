import 'package:flutter/material.dart';

import '../model/user.dart';
import '../widget/user_list.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('UserList Screen rebuilding...');
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        child: UserList(),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}