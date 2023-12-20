import 'package:flutter/material.dart';

class Todo {
  final bool complete;
  final String id;
  final String title;
  final String descriptions;

  Todo({
    this.complete = false,
    this.descriptions = '',
    required this.title,
    String? id,
  }) : id = id ?? UniqueKey().hashCode.toString();
}
