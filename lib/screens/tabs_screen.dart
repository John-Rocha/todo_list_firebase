import 'package:flutter/material.dart';
import 'package:todo_list_firebase/screens/add_task_screen.dart';
import 'package:todo_list_firebase/screens/complete_tasks_screen.dart';
import 'package:todo_list_firebase/screens/favorite_tasks_screen.dart';
import 'package:todo_list_firebase/screens/my_drawer.dart';
import 'package:todo_list_firebase/screens/pending_tasks_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  static const route = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Map<String, dynamic>> _pageDetails = [
    {
      'page': const PendingTasksScreen(),
      'title': 'Pending Tasks',
    },
    {
      'page': const CompleteTasksScreen(),
      'title': 'Complete Tasks',
    },
    {
      'page': const FavoriteTasksScreen(),
      'title': 'Favorite Tasks',
    },
  ];

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: _selectedPageIndex == 0
            ? [
                IconButton(
                  onPressed: () => _addTask(context),
                  icon: const Icon(Icons.add),
                ),
              ]
            : null,
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp),
              label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Complete Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
        ],
      ),
    );
  }
}
