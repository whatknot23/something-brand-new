import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/todo_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailsTodo = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("todo items: ${detailsTodo.myTodo.length.toString()}")),
    );
  }
}
