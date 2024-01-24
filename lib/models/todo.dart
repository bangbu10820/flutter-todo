import 'package:flutter/material.dart';

class Todo {
  final bool complete;
  final int id;
  final String title;
  final String descriptions;

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
