import 'package:my_app/app/models/todo.dart';

class TodoService {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
  }

  void toggleTodo(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex != -1) {
      _todos[todoIndex] = _todos[todoIndex].copyWith(
        completed: !_todos[todoIndex].completed,
      );
    }
  }

  void updateTodo(Todo todo) {
    final todoIndex = _todos.indexWhere((t) => t.id == todo.id);
    if (todoIndex != -1) {
      _todos[todoIndex] = todo;
    }
  }
}
