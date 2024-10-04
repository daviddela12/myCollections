import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Category {
  final String id;
  final String name;
  final IconData icon;

  Category({
    String? id,
    required this.name,
    IconData? icon,
  })  : id = id ?? const Uuid().v4(),
        icon = icon ?? Icons.category;

  // Convert a Category object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Convert a Map object into a Category object
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
    );
  }
}
