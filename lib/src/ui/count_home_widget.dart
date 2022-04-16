import 'package:flutter/material.dart';
import 'package:flutter_prac/provider/count_provider.dart';
import 'package:flutter_prac/src/components/view_count.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key? key}) : super(key: key);
  late CountProvider _countProvider;
  @override
  Widget build(BuildContext context) {
    // 자기 자신이 구독 등록되었으므로 여기서 바뀌어도 rendering됨. 따라서, CountHomeWidget을 또 호출하지 않기위해 읽기만 한다(listen: false) = context.read<T>.
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build called');
    return Scaffold(
      appBar: AppBar(title: Text('Count Provider')),
      body: ViewCountWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                _countProvider.add();
              },
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  fixedSize: const Size(50, 50),
                  shape: const CircleBorder())),
          ElevatedButton(
              onPressed: () {
                _countProvider.remove();
              },
              child: Icon(Icons.remove),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  fixedSize: const Size(50, 50),
                  shape: const CircleBorder())),
        ],
      ),
    );
  }
}
