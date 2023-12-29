import 'package:flutter/material.dart';
import 'package:flutter_todo/database/database_helper.dart';

class DatabaseModel extends ChangeNotifier {
  late DatabaseHelper _databaseHelper;

  DatabaseModel() {
    _databaseHelper = DatabaseHelper();
    _initDb();
  }

  Future<void> _initDb() async {
    await _databaseHelper.initDb();
    notifyListeners();
  }

  DatabaseHelper get databaseHelper => _databaseHelper;
}
