import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_app/features/home/home_viewmodel.dart';
import 'package:my_app/features/home/widgets/todo_item.dart';

class TodoList extends ViewModelWidget<HomeViewModel> {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.todos.length,
      itemBuilder: (context, index) {
        final todo = viewModel.todos[index];
        return TodoItem(
          todo: todo,
          onTap: () => viewModel.toggleTodo(todo.id),
          onEdit: () => viewModel.editTodo(todo),
          onDelete: () => viewModel.deleteTodo(todo.id),
        );
      },
    );
  }
}
