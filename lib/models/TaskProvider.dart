import 'package:slimodoro/models/Task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String newTaskName) {
    _tasks.add(Task(name: newTaskName));
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleTaskCompletion(Task task) {
    task.completed = !task.completed; // update the completed property
    notifyListeners();
  }
}