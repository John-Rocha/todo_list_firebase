import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_firebase/blocs/task_bloc/task_bloc.dart';
import 'package:todo_list_firebase/screens/my_drawer.dart';
import 'package:todo_list_firebase/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const route = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
          ),
          drawer: const MyDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text('${state.removedTasks.length} Tasks'),
                  ),
                ),
                TaskList(tasks: state.removedTasks),
              ],
            ),
          ),
        );
      },
    );
  }
}
