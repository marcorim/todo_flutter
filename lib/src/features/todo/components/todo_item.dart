
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/src/features/todo/models/todo_model.dart';
import 'package:todolist_app/src/features/todo/provider/todo_provider.dart';

class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final formKey = GlobalKey<FormState>();
  final controllerTodo = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Novo To-do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controllerTodo,
                decoration: InputDecoration(
                  labelText: 'To-do',
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: controllerDate,
                decoration: InputDecoration(
                  labelText: 'Date',
                ),
              ),
              const SizedBox(height: 20,),
              TextButton(
                onPressed: () {
                  TodoModel obj = TodoModel(
                    id: Random().nextDouble(),
                    title: controllerTodo.text ,
                    data: '23/11/2021' ,
                  );

                  todo.insert(obj);
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
