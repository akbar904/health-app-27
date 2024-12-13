import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_app/features/home/home_viewmodel.dart';

class TodoInput extends ViewModelWidget<HomeViewModel> {
  const TodoInput({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: viewModel.todoController,
              decoration: const InputDecoration(
                hintText: 'Add a new todo...',
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  viewModel.addTodo();
                }
              },
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              if (viewModel.todoController.text.isNotEmpty) {
                viewModel.addTodo();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
