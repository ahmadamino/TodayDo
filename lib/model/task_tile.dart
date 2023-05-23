import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/controller/task_controller.dart';

class TaskTile extends StatelessWidget {
  TaskContoller contoller = Get.put(TaskContoller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskContoller>(
      init: TaskContoller(),
      builder: (contoller) => ListView.builder(
        shrinkWrap: true,
          itemCount: contoller.tasks.length,
          itemBuilder: (context, i) {
            final task = contoller.tasks[i];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(
                task.description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    contoller.updateTask(task);
                  }),
              trailing: IconButton(onPressed: (){
                contoller.remove(task);
              },icon: Icon(Icons.delete),
              ),
            );
          }),
    );
  }
}
