import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

@immutable
class Todo{
  final String id;
  final String description;
  final bool completed;

  const Todo({required this.id, required this.description, this.completed = false});

  @override
  String toString() {
    // TODO: implement toString
    return 'Todo(description: $description, completed: $completed)';
  }
}

class TodoList extends StateNotifier<List<Todo>>{
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(String description){
    state = [...state, Todo(
      id: _uuid.v4(),
      description: description
    )];
  }

  void toggle(String id){
    // 괄호가 있으면 안됨??? (in for, if)
    // state = [
    //   for(final todo in state){
    //     if(todo.id == id){
    //       Todo(
    //         id: todo.id,
    //         completed: !todo.completed,
    //         description: todo.description,
    //       )
    //     }else{
    //       todo,
    //     }
    //   }
    // ];

    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: !todo.completed,
            description: todo.description,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}){
    state=[
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: todo.completed,
            description: description,
          )
        else
          todo,
    ];
  }

  void remove(Todo target){
    state = state.where((todo) => todo.id != target.id).toList();
  }
}