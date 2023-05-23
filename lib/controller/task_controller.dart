import 'package:get/get.dart';
import 'package:todo_app/model/task_descr.dart';

class TaskContoller extends GetxController {
  final List<Task> _task = [];

  List<Task> get tasks => _task;

  void addTask(Task task) {
    _task.add(task);
    update();
  }

  int get count {
    return _task.length;
  }

  void remove(Task task) {
    _task.remove(task);
    update();
  }

  void updateTask(Task task) {
    task.doneChange();
    update();
  }
}
