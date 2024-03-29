import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_todo/database/database_helper.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoListModel extends ChangeNotifier {
  /// Internal, private state of the todo list.
  final List<Todo> _todos = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  TodoListModel() {
    _init();
  }

  void _init() async {
    final todos = await DatabaseHelper.getTodos();
    _todos.addAll(todos);
    notifyListeners();
  }

  /// Adds [todo] to list. This and [removeAll] are the only ways to modify the
  /// list from the outside.
  void add(Todo todo) {
    _todos.add(todo);
    DatabaseHelper.insertTodo(todo);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the list.
  void removeAll() {
    _todos.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
