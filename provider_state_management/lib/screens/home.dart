import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/todo_provider.dart';
import 'details.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Add new todo"),
              content: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: "title"),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(hintText: "description"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          final title = _titleController.text;
                          final description = _descriptionController.text;
                          todo.addNewTodo(title, description);
                          Navigator.pop(context);
                        },
                        child: Text("Add")),
                  )
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomSheet: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DetailScreen()));
          },
          child: const Text("jump to details")),
      body: ListView.builder(
          itemCount: todo.myTodo.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(todo.myTodo[index].title),
              subtitle: Text(todo.myTodo[index].description),
              trailing: IconButton(
                  onPressed: () {
                    todo.removeTodo(index);
                  },
                  icon: Icon(Icons.remove_outlined)),
            );
          }),
    );
  }
}
