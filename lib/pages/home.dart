import 'package:flutter/material.dart';
import 'package:flutter_todo/provider_models/todo_list_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).push('/create');
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Consumer<TodoListModel>(
          builder: (context, list, child) {
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(list.todos[index].title),
              subtitle: Text(list.todos[index].descriptions),
            ),
            itemCount: list.todos.length,
          );
        }));
  }
}
