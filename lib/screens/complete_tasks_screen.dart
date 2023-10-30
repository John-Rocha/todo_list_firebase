import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_bloc.dart';
import 'package:todo_list_firebase/models/task.dart';
import 'package:todo_list_firebase/widgets/task_list.dart';

class CompleteTasksScreen extends StatelessWidget {
  const CompleteTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTasks;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Center(
                child: Chip(
                  label: Text(
                      '${taskList.length} Complete | ${state.pendingTasks.length} Pending | ${state.favoriteTasks.length} Favorite'),
                ),
              ),
              TaskList(tasks: taskList),
            ],
          ),
        );
      },
    );
  }
}
