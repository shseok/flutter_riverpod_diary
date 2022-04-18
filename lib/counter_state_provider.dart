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
    // final counter = ref.watch(counterStateProvider);
    final counter = ref.watch(counterStateProvider.state).state;
    return Scaffold(
        appBar: AppBar(
          title: Text('StateProvider'),
        ),
        body: Center(
          // child: Text(
          //   '${counter}',
          //   style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          // ),
          // Consumer is a widget that allows you reading providers.
          child: Consumer(builder: (context, ref, child){
            final count = ref.watch(counterStateProvider.state).state++;
            return Text('$count');
          },)

        ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => {
                // The read method is a utility to read a provider without listening to it
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
