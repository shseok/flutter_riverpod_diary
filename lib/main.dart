import 'package:flutter/material.dart'; // 기본 내장
import 'package:flutter_prac/provider/todo_provider.dart';
import 'package:flutter_prac/ui/filter_widget.dart';
import 'package:flutter_prac/ui/floating_button_widget.dart';
import 'package:flutter_prac/ui/item_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// Some keys used for testing
final addTodoKey = UniqueKey();
final activeFilterKey = UniqueKey();
final completedFilterKey = UniqueKey();
final allFilterKey = UniqueKey();

// 등록 후 내장
void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      home: MyPage(),
    );
  }
}

class MyPage extends HookConsumerWidget {

  MyPage({Key? key}) : super(key: key);

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  var rmicons = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodos);
    final newTodoController =
        useTextEditingController(); // import 'package:flutter_hooks/flutter_hooks.dart';
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('My Plan', style: GoogleFonts.getFont('Lato',textStyle: TextStyle(fontSize: 20.0))),
              centerTitle: true,
            ),
            body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                children: [
                  // TitleWidget(),
                  // const SizedBox(height: 42),
                  Toolbar(),
                  const SizedBox(height: 19),
                  // if (todos.isNotEmpty) const Divider(height: 50),
                  for (var i = 0; i < todos.length; i++) ...[
                    if (i > 0) const SizedBox(height: 5),
                        Dismissible(
                          key: ValueKey(todos[i].id),
                          onDismissed: (_) {
                            // print(ref.read(todoListProvider.notifier).runtimeType);
                            ref.read(todoListProvider.notifier).remove(todos[i]);
                          },
                          child: ProviderScope(
                            overrides: [
                              currentTodo.overrideWithValue(todos[i]),
                            ],
                            child: const TodoItem(),
                          ),
                        ),
                  ],
                  TextField(
                    key: addTodoKey,
                    controller: newTodoController,
                    decoration: const InputDecoration(
                      labelText: '추가하기',
                    ),
                    onSubmitted: (value) {
                      ref.read(todoListProvider.notifier).add(value);
                      newTodoController.clear();
                    },
                  ),
                ]
            ),
          floatingActionButton: myFloatingActionButtonWidget(isDialOpen: isDialOpen, rmicons: rmicons,),
        )
    );
  }
}