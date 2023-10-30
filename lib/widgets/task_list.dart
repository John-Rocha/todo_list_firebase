import 'package:flutter/material.dart';
import 'package:todo_list_firebase/models/task.dart';
import 'package:todo_list_firebase/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasks
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  body: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: ListTile(
                      title: SelectableText.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Title\n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: task.title),
                            const TextSpan(
                              text: '\n\nDescription\n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: task.description),
                          ],
                        ),
                      ),
                    ),
                  ),
                  headerBuilder: (context, isExpanded) => TaskTile(task: task),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// Expanded(
//       child: ListView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: tasks.length,
//         itemBuilder: (context, index) {
//           final task = tasks[index];
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 8),
//             child: TaskTile(task: task),
//           );
//         },
//       ),
//     )
