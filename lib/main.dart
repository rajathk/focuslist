import 'package:flutter/material.dart';
import 'package:focuslist/services/todo_service.dart';
import 'package:focuslist/view_models/todo_view_model.dart';
import 'package:focuslist/views/todo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoViewModel(TodoService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    ),
  );
}
