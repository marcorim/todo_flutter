import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/src/core/app_routes.dart';
import 'package:todolist_app/src/features/todo/components/Todo_page.dart';
import 'package:todolist_app/src/features/todo/components/todo_item.dart';
import 'package:todolist_app/src/features/todo/provider/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => TodoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'TODO List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
        ),
        home: TodoPage(),
        routes: {
          AppRoutes.TODO_ITEM: (ctx) => TodoItem(),
        },
      ),
    );
  }
}
