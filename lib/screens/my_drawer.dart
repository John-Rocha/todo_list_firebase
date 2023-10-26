import 'package:flutter/material.dart';

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
            const ListTile(
              leading: Icon(Icons.folder_special),
              title: Text('My Tasks'),
              trailing: Text('0'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.delete),
              title: Text('Bin'),
              trailing: Text('0'),
            )
          ],
        ),
      ),
    );
  }
}
