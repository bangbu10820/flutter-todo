import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/provider_models/todo_list_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateToDoPage extends StatelessWidget {
  const CreateToDoPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    var list = context.read<TodoListModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: contentController,
                minLines: 5,
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
              list.add(Todo(
                  title: titleController.text,
                  descriptions: contentController.text));
              context.pop();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text('Create'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
