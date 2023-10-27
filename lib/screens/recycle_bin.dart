import 'package:flutter/material.dart';
import 'package:todo_list_firebase/screens/my_drawer.dart';
import 'package:todo_list_firebase/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const route = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
      ),
      drawer: const MyDrawer(),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(' Tasks'),
              ),
            ),
            TaskList(tasks: []),
          ],
        ),
      ),
    );
  }
}
