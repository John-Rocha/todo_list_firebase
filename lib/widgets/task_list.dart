import 'package:flutter/material.dart';
import 'package:todo_list_firebase/models/task.dart';
import 'package:todo_list_firebase/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TaskTile(task: task),
          );
        },
      ),
    );
  }
}
