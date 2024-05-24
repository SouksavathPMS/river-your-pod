import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  const Todo({
    required this.id,
    required this.description,
    required this.completed,
  });

  final String id;
  final String description;
  final bool completed;

  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

final todosProvider = NotifierProvider<TodosNotifier, List<Todo>>(() {
  return TodosNotifier();
});

class TodosNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return [];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);

    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.completed,
            onChanged: (value) =>
                ref.read(todosProvider.notifier).toggle(todo.id),
            title: Text(todo.description),
          ),
      ],
    );
  }
}
