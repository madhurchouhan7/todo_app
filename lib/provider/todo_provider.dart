import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/model/todo.dart';

class TodoProvider extends ChangeNotifier {

  // This connects the main file to generated code,
  final Box<Todo> _taskBox = Hive.box<Todo>('taskBox');

  // This returns the list of todos.
  List<Todo> get todos => _taskBox.values.toList();


  // This adds a task to the list of todos.
  void addTask(String title) {
    final todo = Todo(
      title: title,
    );
    _taskBox.add(todo);
    notifyListeners();
  }

  // This toggles the task.
  void toggleTask(int index) {
    final todo = _taskBox.getAt(index);
    if (todo != null) {
      _taskBox.putAt(index, Todo(title: todo.title, isDone: !todo.isDone));
      notifyListeners();
    }
    notifyListeners();
  }

  // This deletes the task.
  void deleteTask(int index) {
    _taskBox.deleteAt(index);
    notifyListeners();
  }
}
