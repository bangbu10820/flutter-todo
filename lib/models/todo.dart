import 'package:flutter/material.dart';

class Todo {
  bool complete;
  int id;
  String title;
  String descriptions;

  Todo({
    this.complete = false,
    this.descriptions = '',
    required this.title,
    int? id,
  }) : id = id ?? UniqueKey().hashCode.toInt();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'descriptions': descriptions,
      'complete': complete ? 1 : 0,
    };
  }
}
