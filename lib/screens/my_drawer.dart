import 'package:flutter/material.dart';
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
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(TasksScreen.route);
              },
              leading: const Icon(Icons.folder_special),
              title: const Text('My Tasks'),
              trailing: const Text('0'),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(RecycleBin.route);
              },
              leading: const Icon(Icons.delete),
              title: const Text('Bin'),
              trailing: const Text('0'),
            )
          ],
        ),
      ),
    );
  }
}
