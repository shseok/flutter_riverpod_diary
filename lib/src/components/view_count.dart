import 'package:flutter/material.dart';
import 'package:flutter_prac/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ViewCountWidget extends StatelessWidget {
  const ViewCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Center(
      child: Consumer<CountProvider>(
          builder: (context, provider, child) =>
              Text(provider.count.toString(), style: TextStyle(fontSize: 80))),
    );
  }
}
