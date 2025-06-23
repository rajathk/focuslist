import 'package:realm/realm.dart';

part 'todo.realm.dart';

@RealmModel()
class _Todo {
  late String id;
  late String title;
  late bool isDone;

  //Todo({required this.id, required this.title, this.isDone = false});
}