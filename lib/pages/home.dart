import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/provider_models/todo_list_model.dart';
import 'package:flutter_todo/router.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Consumer<TodoListModel>(
        builder: (context, list, child) {
          return SlidableAutoCloseBehavior(
            child: ListView.builder(
              itemBuilder: (context, index) => Slidable(
                key: ValueKey(list.todos[index].id),
                groupTag: '0',
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) => {
                        context.push(ScreenPaths.edit, extra: list.todos[index])
                      },
                      backgroundColor: const Color.fromARGB(255, 0, 0, 255),
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                    SlidableAction(
                      onPressed: (context) => {
                        context.read<TodoListModel>().delete(
                              Todo(
                                id: list.todos[index].id,
                                title: list.todos[index].title,
                                descriptions: list.todos[index].descriptions,
                              ),
                            )
                      },
                      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(list.todos[index].title),
                  subtitle: Text(
                    list.todos[index].descriptions,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              itemCount: list.todos.length,
            ),
          );
        },
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
