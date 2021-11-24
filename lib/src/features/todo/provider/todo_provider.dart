import 'package:flutter/material.dart';
import 'package:todolist_app/src/features/todo/models/todo_model.dart';
import 'package:todolist_app/src/features/todo/repository/todo_repository.dart';

enum TodoState { idle, success, error, loading }

class TodoProvider with ChangeNotifier {
  var state = TodoState.idle;

  List<TodoModel> _todoItems = [];

  List<TodoModel> get todoItems {
    return [..._todoItems];
  }

  Future<List<TodoModel>> fetchTodo() async {
    final repository = TodoRepository();

    try {
      _todoItems = await repository.fetch();

      notifyListeners();
      return _todoItems;
    } catch (e) {
      _todoItems=[];

      notifyListeners();
      return _todoItems;
    }
  }

  Future<void> insert(TodoModel obj) async {
    final repository = TodoRepository();

    state = TodoState.loading;
    notifyListeners();

    try {
      await repository.insert(obj);
      state = TodoState.success;
      notifyListeners();
    } catch (e) {
      state = TodoState.error;
      notifyListeners();
    }
  }

}