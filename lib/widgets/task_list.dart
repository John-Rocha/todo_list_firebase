import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_event.dart';
import 'package:todo_list_firebase/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.title),
          trailing: Checkbox(
            value: task.isDone,
            onChanged: (value) {
              context.read<TaskBloc>().add(UpdateTask(task: task));
            },
          ),
          onLongPress: () => context.read<TaskBloc>().add(
                DeleteTask(task: task),
              ),
        );
      },
    );
  }
}
