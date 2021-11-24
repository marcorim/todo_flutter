

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/src/core/app_routes.dart';
import 'package:todolist_app/src/features/todo/models/todo_model.dart';
import 'package:todolist_app/src/features/todo/provider/todo_provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    print('passei aqui');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To do list',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _retrieve(context);
              },
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.TODO_ITEM,
          );
        },
      ),
      body: _retrieve(context),
    );
  }

  FutureBuilder<List<TodoModel>> _retrieve(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TodoProvider>(context, listen: false).fetchTodo(),
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.none) {
          return Center(
            child: Text('Nao há registros cadastrado.'),
          );
        }

        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
            );
        } else {
          return Consumer<TodoProvider>(
            builder: (context, data, child) => ListView.builder(
              itemCount: data.todoItems.length,
              itemBuilder: (context, i) => _todoItems(data.todoItems[i]),
            ),
          );
        }
      },
    );
  }

  _todoItems(TodoModel todoItem) {
    return Card(
      shadowColor: Colors.black26,
      elevation: 4,
      child: ListTile(
        leading: Text(todoItem.data),
        title: Text(todoItem.title),
      ),
    );
  }

}
