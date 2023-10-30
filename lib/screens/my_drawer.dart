import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/switch_theme_bloc/switch_theme_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_bloc.dart';
import 'package:todo_list_firebase/screens/recycle_bin.dart';
import 'package:todo_list_firebase/screens/tasks_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(TasksScreen.route);
                  },
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.allTasks.length}'),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RecycleBin.route);
                  },
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                );
              },
            ),
            const Divider(),
            BlocBuilder<SwitchThemeBloc, SwitchThemeState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(
                    state.switchValue ? Icons.mode_night : Icons.sunny,
                    color: Colors.amber,
                  ),
                  title: Switch.adaptive(
                    value: state.switchValue,
                    onChanged: (newValue) {
                      newValue
                          ? context
                              .read<SwitchThemeBloc>()
                              .add(const SwitchOnEvent())
                          : context
                              .read<SwitchThemeBloc>()
                              .add(const SwitchOffEvent());
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
