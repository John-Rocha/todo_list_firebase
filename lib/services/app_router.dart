import 'package:flutter/material.dart';
import 'package:todo_list_firebase/screens/recycle_bin.dart';
import 'package:todo_list_firebase/screens/tabs_screen.dart';
import 'package:todo_list_firebase/screens/pending_tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      RecycleBin.route => MaterialPageRoute(
          builder: (_) {
            return const RecycleBin();
          },
        ),
      PendingTasksScreen.route => MaterialPageRoute(
          builder: (_) {
            return const PendingTasksScreen();
          },
        ),
      TabsScreen.route => MaterialPageRoute(
          builder: (_) {
            return TabsScreen();
          },
        ),
      _ => null,
    };
  }
}
