import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCounter extends StateNotifier<int> {
  MyCounter() : super(0);

  void increment() => state++;

  void decrement() => state--;

  void initCount() => state = 0;
}

final myCounterStateNotifierProvider =
    StateNotifierProvider<MyCounter, int>((ref) {
  return MyCounter();
});

class CounterStateNotifier extends ConsumerWidget {
  const CounterStateNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counterRead = ref.read(myCounterStateNotifierProvider.notifier);
    final counterRead = ref.watch(myCounterStateNotifierProvider.notifier);
    final counterState = ref.watch(myCounterStateNotifierProvider);

    ref.listen(
      myCounterStateNotifierProvider,
      ((int? previousCount, int newCount) {
        print('바뀔때마다 동작');
        print('ref.listen: $previousCount (The counter unchanged)');
        print('ref.listen: $newCount (The counter changed)');
      }),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Practice'),
      ),
      body: Center(
        child: Text(
          'Value: $counterState',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '111',
              onPressed: () => counterRead.increment(),
              child: const Icon(
                Icons.add,
              ),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              heroTag: '222',
              onPressed: () => counterRead.decrement(),
              child: const Icon(
                Icons.remove,
              ),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              heroTag: '333',
              onPressed: () => counterRead.initCount(),
              child: const Icon(
                Icons.refresh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
