import 'package:flutter/material.dart';
import 'package:todo_list_firebase/screens/recycle_bin.dart';
import 'package:todo_list_firebase/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RecycleBin.route => MaterialPageRoute(
          builder: (_) {
            return const RecycleBin();
          },
        ),
      TasksScreen.route => MaterialPageRoute(
          builder: (_) {
            return const TasksScreen();
          },
        ),
      _ => null,
    };
  }
}
