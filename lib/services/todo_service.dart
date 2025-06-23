import 'package:realm/realm.dart';

import '../models/todo.dart';

class TodoService {

  final Realm realm = Realm(Configuration.local([Todo.schema]));

  List<Todo> getTodos() => realm.all<Todo>().toList();

  void addTodo(String title) {
    final todo = Todo(ObjectId().toString(), title, false);
    realm.write(() => realm.add(todo));
  }

  void toggleTodo(String id){
    final todo = realm.all<Todo>().firstWhere((t) => t.id == id);
    realm.write(() => todo.isDone = !todo.isDone);
  }

  void removeTodo(String id){
    final todo = realm.all<Todo>().firstWhere((t) => t.id == id);
    realm.write(() => realm.delete(todo));
  }
}