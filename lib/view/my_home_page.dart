import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/task_controller.dart';
import 'package:todo_app/model/task_descr.dart';
import 'package:todo_app/model/task_tile.dart';
import 'package:todo_app/view/add_task_page.dart';

class MyHomePage extends StatelessWidget {
  TaskContoller contoller = Get.put(TaskContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: Text(
          'To Day Do',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[300],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.playlist_add_check),
        ),
        elevation: 0,
      ),
      body: GetBuilder<TaskContoller>(
        init: TaskContoller(),
        builder: (contoller) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${contoller.count} Tasks',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TaskTile(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => _openAddTaskPage(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _openAddTaskPage() async {
    TaskContoller contoller = Get.put(TaskContoller());
    final result = await Get.to(AddTaskPage());
    if (result != null) {
      contoller.addTask(result as Task);
    }
  }
}
