import 'package:flutter/material.dart';
import 'package:provider_state_management/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> myTodo = [];
  addNewTodo(newTitle, newDescriptio) {
    var newTodo = Todo(title: newTitle, description: newDescriptio);
    myTodo.add(newTodo);
    notifyListeners();
  }

  removeTodo(index) {
    myTodo.removeAt(index);
    notifyListeners();
  }
}
