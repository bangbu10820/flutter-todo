import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/provider_models/todo_list_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditToDoPage extends StatelessWidget {
  final Todo todo;
  const EditToDoPage({super.key, required this.todo});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController titleController =
        TextEditingController(text: todo.title);
    TextEditingController contentController =
        TextEditingController(text: todo.descriptions);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: contentController,
                minLines: 5,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  alignLabelWithHint: true,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: () {
              context.read<TodoListModel>().update(
                    Todo(
                      id: todo.id,
                      title: titleController.text,
                      descriptions: contentController.text,
                    ),
                  );
              context.pop();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text('Edit'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
