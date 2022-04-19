import 'package:flutter/material.dart';
import 'package:flutter_prac/main.dart';
import 'package:flutter_prac/provider/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoListFilter);

    Color textColorFor(TodoListFilter value) {
      return filter == value ? Colors.white : Colors.black;
    }

    Color primaryColorFor(TodoListFilter value) {
      return filter == value ? Color(0xffA876DE) : Colors.white;
    }

    return Material(
      child: Container(
        // color: Colors.red,
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Tooltip(
                key: allFilterKey,
                message: 'All todos',
                child: ElevatedButton(
                  onPressed: () => ref.read(todoListFilter.notifier).state =
                      TodoListFilter.all,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(3),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        textColorFor(TodoListFilter.all)),
                    // textStyle: MaterialStateProperty.all(TextStyle(color: textColorFor(TodoListFilter.all))), textColorFor's constructor가 const라서 x!!!!!!
                    backgroundColor: MaterialStateProperty.all<Color>(
                        primaryColorFor(TodoListFilter.all)),
                  ),
                  child: Text('전체',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            SizedBox(width: 5.0),
            Expanded(
              child: Tooltip(
                key: activeFilterKey,
                message: 'Only uncompleted todos',
                child: ElevatedButton(
                  onPressed: () => ref.read(todoListFilter.notifier).state =
                      TodoListFilter.active,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(3),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        textColorFor(TodoListFilter.active)),
                    // textStyle: MaterialStateProperty.all(TextStyle(color: textColorFor(TodoListFilter.all))), textColorFor's constructor가 const라서 x!!!!!!
                    backgroundColor: MaterialStateProperty.all<Color>(
                        primaryColorFor(TodoListFilter.active)),
                  ),
                  child: Text('미완료',
                      style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight
                              .w500)), // Text가 const였으면 complie error...
                ),
              ),
            ),
            SizedBox(width: 5.0),
            Expanded(
              child: Tooltip(
                key: completedFilterKey,
                message: 'Only completed todos',
                child: ElevatedButton(
                  onPressed: () => ref.read(todoListFilter.notifier).state =
                      TodoListFilter.completed,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(3),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        textColorFor(TodoListFilter.completed)),
                    // textStyle: MaterialStateProperty.all(TextStyle(color: textColorFor(TodoListFilter.all))), textColorFor's constructor가 const라서 x!!!!!!
                    backgroundColor: MaterialStateProperty.all<Color>(
                        primaryColorFor(TodoListFilter.completed)),
                  ),
                  child: Text('완료',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
