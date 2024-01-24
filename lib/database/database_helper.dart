import 'package:flutter_todo/models/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseHelper {
  static late Database _database;

  static Future<void> initDb() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'Todo.db');
    _database =
        await openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY, title TEXT, descriptions TEXT, complete INTEGER)');
    });
  }

  static Future<int> insertTodo(Todo todo) async {
    return await _database.insert('todo', todo.toMap());
  }

  static Future<int> updateTodo(Todo todo) async {
    return await _database.update(
        'todo', {'title': todo.title, 'descriptions': todo.descriptions},
        where: 'id = ?', whereArgs: [todo.id]);
  }

  static Future<int> deleteTodo(int id) async {
    return await _database.delete('todo', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Todo>> getTodos() async {
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
