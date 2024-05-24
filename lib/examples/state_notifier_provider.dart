import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_your_pod/examples/notifier.dart';

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);
  // Add more fucntion
}
