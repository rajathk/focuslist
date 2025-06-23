// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class Todo extends _Todo with RealmEntity, RealmObjectBase, RealmObject {
  Todo(String id, String title, bool isDone) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'isDone', isDone);
  }

  Todo._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  bool get isDone => RealmObjectBase.get<bool>(this, 'isDone') as bool;
  @override
  set isDone(bool value) => RealmObjectBase.set(this, 'isDone', value);

  @override
  Stream<RealmObjectChanges<Todo>> get changes =>
      RealmObjectBase.getChanges<Todo>(this);

  @override
  Stream<RealmObjectChanges<Todo>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Todo>(this, keyPaths);

  @override
  Todo freeze() => RealmObjectBase.freezeObject<Todo>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'isDone': isDone.toEJson(),
    };
  }

  static EJsonValue _toEJson(Todo value) => value.toEJson();
  static Todo _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'isDone': EJsonValue isDone,
      } =>
        Todo(fromEJson(id), fromEJson(title), fromEJson(isDone)),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Todo._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Todo, 'Todo', [
      SchemaProperty('id', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('isDone', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
