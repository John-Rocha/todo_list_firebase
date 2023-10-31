import 'package:flutter/material.dart';
import 'package:todo_list_firebase/models/task.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
    required this.task,
    required this.onTap,
  });

  final Task task;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: !task.isDeleted!
          ? (context) {
              return [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.bookmark),
                    label: const Text('Add to Bookmarks'),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  onTap: onTap,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                  ),
                ),
              ];
            }
          : (context) => [
                PopupMenuItem(
                  onTap: onTap,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete),
                    label: const Text('Restore'),
                  ),
                ),
              ],
    );
  }
}
