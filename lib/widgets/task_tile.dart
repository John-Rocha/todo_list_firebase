import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_bloc.dart';
import 'package:todo_list_firebase/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTask(task: task))
        : context.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone! ? TextDecoration.lineThrough : null,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: task.isDone == true ? Colors.grey[300] : null,
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) {
                context.read<TaskBloc>().add(UpdateTask(task: task));
              }
            : null,
      ),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
  }
}
