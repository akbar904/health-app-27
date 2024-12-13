import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_app/app/models/todo.dart';
import 'package:my_app/app/services/todo_service.dart';

class HomeViewModel extends BaseViewModel {
  final TodoService _todoService;
  final DialogService _dialogService;
  final TextEditingController todoController = TextEditingController();

  HomeViewModel()
      : _todoService = TodoService(),
        _dialogService = DialogService();

  List<Todo> get todos => _todoService.todos;

  void addTodo() {
    if (todoController.text.isNotEmpty) {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: todoController.text,
      );
      _todoService.addTodo(todo);
      todoController.clear();
      notifyListeners();
    }
  }

  void toggleTodo(String id) {
    _todoService.toggleTodo(id);
    notifyListeners();
  }

  void deleteTodo(String id) {
    _todoService.removeTodo(id);
    notifyListeners();
  }

  Future<void> editTodo(Todo todo) async {
    final response = await _dialogService.showDialog(
      dialogData: DialogRequest(
        data: todo,
      ),
    );

    if (response?.confirmed == true && response?.data != null) {
      final updatedTodo = todo.copyWith(title: response!.data as String);
      _todoService.updateTodo(updatedTodo);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }
}