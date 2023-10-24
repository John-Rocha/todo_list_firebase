import 'package:flutter/material.dart';
import 'package:todo_list_firebase/core/ui/app_ui.dart';
import 'package:todo_list_firebase/screens/tasks_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppUi.theme,
      home: const TasksScreen(),
    );
  }
}
