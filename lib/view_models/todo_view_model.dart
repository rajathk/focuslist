import 'package:flutter/cupertino.dart';

import '../models/todo.dart';
import '../services/todo_service.dart';

class TodoViewModel extends ChangeNotifier {

  final TodoService _todoService;

  List<Todo> _todos =[];

  List<Todo> get todos => _todos;

  TodoViewModel(this._todoService){
    loadTodos();
  }

  void loadTodos(){
    _todos = _todoService.getTodos();
    notifyListeners();
  }


  void addTodo(String title) {
    if (title.trim().isEmpty) return;
    _todoService.addTodo(title);
    loadTodos();
  }

  void toggleTodoStatus(String id){
    _todoService.toggleTodo(id);
    loadTodos();
  }

  void removeTodo(String id){
    _todoService.removeTodo(id);
    loadTodos();
  }

}