import 'package:sqflite/sqflite.dart';
import 'package:todolist_app/src/core/db.dart';
import 'package:todolist_app/src/features/todo/models/todo_model.dart';

class TodoRepository {
  Future<Database?> get db => DatabaseHelper.getInstance().db;

  Future<List<TodoModel>> fetch() async {
    final dbClient = await db;
    final list = await dbClient!.rawQuery('select * from todo');
    final todo = list.map<TodoModel>((json) => TodoModel.fromJson(json)).toList();
    return todo;
  }

  Future<void> insert(TodoModel obj) async {
    var dbClient = await db;
    await dbClient!.insert("todo", obj.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}