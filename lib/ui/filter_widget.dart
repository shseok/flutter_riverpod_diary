import 'package:flutter/material.dart';
import 'package:flutter_prac/main.dart';
import 'package:flutter_prac/provider/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoListFilter);

    Color? textColorFor(TodoListFilter value) {
      return filter == value ? Colors.blue : Colors.black;
    }

    return Material(
        child: Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   child: Text(
            //     '${ref.watch(uncompletedTodosCount).toString()} items left',
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            Tooltip(
              key: allFilterKey,
              message: 'All todos',
              child: ElevatedButton(
                onPressed: () =>
                ref.read(todoListFilter.notifier).state = TodoListFilter.all,
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                ),
                child: const Text('전체', style:TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            SizedBox(width: 10.0),
            Tooltip(
              key: completedFilterKey,
              message: 'Only completed todos',
              child: ElevatedButton(
                onPressed: () => ref.read(todoListFilter.notifier).state =
                    TodoListFilter.completed,
                style:ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                ),
                child: const Text('완료', style:TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10.0),
            Tooltip(
              key: activeFilterKey,
              message: 'Only uncompleted todos',
              child: ElevatedButton(
                onPressed: () => ref.read(todoListFilter.notifier).state =
                    TodoListFilter.active,
                style:ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                ),
                child: const Text('미완료', style:TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}