import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/todo.dart';

class TodoItemTile extends StatelessWidget {
  final Todo todo;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const TodoItemTile({required this.todo, required this.onTap, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
      title: Text(todo.title,
      style: TextStyle(decoration: todo.isDone ? TextDecoration.lineThrough : null),),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: onDelete,
          )
        ],
      ),
      onTap: onTap,
    );
  }
}