import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_event.dart';
import 'package:todo_list_firebase/core/ui/app_ui.dart';
import 'package:todo_list_firebase/models/task.dart';
import 'package:todo_list_firebase/screens/tasks_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()
        ..add(
          AddTask(
            task: Task(title: 'Task1'),
          ),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppUi.theme,
        home: const TasksScreen(),
      ),
    );
  }
}
