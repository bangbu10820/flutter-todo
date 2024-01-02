import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/provider_models/database_model.dart';
import 'package:flutter_todo/provider_models/todo_list_model.dart';
import 'package:flutter_todo/router.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final db = context.watch<DatabaseModel>().databaseHelper;
    final list = context.watch<TodoListModel>();
    list.removeAll();
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: FutureBuilder(
        future: db.getTodos(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print('${snapshot.error}');
            return const Center(
              child: Text('Error loading data'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data'),
            );
          } else {
            final todos = snapshot.data as List<Todo>;
            if (todos.isEmpty) {
              return const Center(
                child: Text('Không có todo nào!'),
              );
            }
            for (var element in todos) {
              list.add(Todo(
                  title: element.title, descriptions: element.descriptions));
            }
            return ListView.builder(
              itemCount: list.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(list.todos[index].title),
                  subtitle: Text(list.todos[index].descriptions),
                );
              },
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(ScreenPaths.create);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
