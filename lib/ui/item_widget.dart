import 'package:flutter/material.dart';
import 'package:flutter_prac/provider/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // useFocus , useTextEditingController, useState, useEffect
import 'package:google_fonts/google_fonts.dart';

class TodoItem extends HookConsumerWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(currentTodo);
    print(todo);
    final itemFocusNode = useFocusNode();
    final itemIsFocused = useIsFocused(itemFocusNode);

    final textEditingController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Checkbox(
              shape: const CircleBorder(),
              activeColor:const Color(0xffA876DE),
              value: todo.completed,
              onChanged: (value) =>
                  ref.read(todoListProvider.notifier).toggle(todo.id),
            ),
          ),
          Expanded(
            flex: 8,
            child: Material(
              color: Colors.white,
              elevation: 3,
              borderRadius: BorderRadius.circular(4),
              child: Focus(
                focusNode: itemFocusNode,
                onFocusChange: (focused) {
                  if (focused) {
                    textEditingController.text = todo.description;
                  } else {
                    // Commit changes only when the textfield is unfocused, for performance
                    ref.read(todoListProvider.notifier).edit(
                        id: todo.id, description: textEditingController.text);
                  }
                },
                child: ListTile(
                  onTap: () {
                    itemFocusNode.requestFocus();
                    textFieldFocusNode.requestFocus();
                  },
                  // 추후 카테고리 넣기
                  // leading: Checkbox(
                  //   value: todo.completed,
                  //   onChanged: (value) =>
                  //       ref.read(todoListProvider.notifier).toggle(todo.id),
                  // ),
                  title: itemIsFocused
                      ? TextField(
                          autofocus: true,
                          focusNode: textFieldFocusNode,
                          controller: textEditingController,
                        )
                      : Text(todo.description),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

bool useIsFocused(FocusNode node) {
  final isFocused = useState(node.hasFocus);

  useEffect(() {
    void listener() {
      isFocused.value = node.hasFocus;
    }

    node.addListener(listener);
    return () => node.removeListener(listener);
  }, [node]);

  return isFocused.value;
}
