import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// stateProvider : search를 담아두는 provider, todo all, ... button click시
// 단순히 특정 값을 읽기만 하고 싶은 경우.
// 비동기 처리가 필요 없는 경우.

// final counterStateProvider = StateProvider<int>((ref) {
//   return 0;
// });
final counterStateProvider = StateProvider((ref) => 0); // type 추론

class CounterStateProvider extends ConsumerWidget {
  const CounterStateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStateProvider.state);
    return Scaffold(
        appBar: AppBar(
          title: Text('StateProvider'),
        ),
        body: Center(
          child: Text(
            '${counter.state}',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
        ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => {
                ref.read(counterStateProvider.state).state++
              },
              heroTag: null,
            ),
            SizedBox(width: 10.0),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => ref.read(counterStateProvider.state).state--,
              heroTag: null,
            ),
          ],
        ),
      ),
    );
  }
}
