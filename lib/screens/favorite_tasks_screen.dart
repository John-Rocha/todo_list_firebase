import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_bloc.dart';
import 'package:todo_list_firebase/models/task.dart';
import 'package:todo_list_firebase/widgets/task_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTasks;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Center(
                child: Chip(
                  label: Text(
                      '${taskList.length} Favorite | ${state.pendingTasks.length} Pending | ${state.completedTasks.length} Complete'),
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
