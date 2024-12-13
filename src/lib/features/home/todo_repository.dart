import 'package:my_app/app/models/todo.dart';
import 'package:my_app/app/services/todo_service.dart';

class TodoRepository {
  final TodoService _todoService;

  TodoRepository(this._todoService);

  List<Todo> getTodos() {
    return _todoService.todos;
  }

  void addTodo(Todo todo) {
    _todoService.addTodo(todo);
  }

  void removeTodo(String id) {
    _todoService.removeTodo(id);
  }

  void toggleTodo(String id) {
    _todoService.toggleTodo(id);
  }

  void updateTodo(Todo todo) {
    _todoService.updateTodo(todo);
  }
}
