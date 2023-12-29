import 'package:flutter_todo/models/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initDb() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'Todo.db');
    _database =
        await openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY, title TEXT, descriptions TEXT, complete INTEGER)');
    });
  }

  Future<int> insertTodo(Todo todo) async {
    return await _database.insert('todo', todo.toMap());
  }

  Future<List<Todo>> getTodos() async {
    List<Map<String, dynamic>> maps = await _database.query('todo');
    return List.generate(maps.length, (index) {
      return Todo(
        id: maps[index]['id'],
        title: maps[index]['title'],
        descriptions: maps[index]['descriptions'],
        complete: maps[index]['complete'] == 1,
      );
    });
  }
}
