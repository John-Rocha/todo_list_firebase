// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_bloc.dart';
import 'package:todo_list_firebase/models/task.dart';
import 'package:todo_list_firebase/widgets/task_list.dart';

class PendingTasksScreen extends StatefulWidget {
  const PendingTasksScreen({super.key});

  static const route = 'task_screen';

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.pendingTasks.length} Tasks'),
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
