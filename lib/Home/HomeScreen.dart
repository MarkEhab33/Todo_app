import 'package:flutter/material.dart';
import 'package:todo_app/Home/task_list/AddTaskBottomSheet.dart';
import 'package:todo_app/MyTheme.dart';
import 'package:todo_app/Home/task_list/task_list_tab.dart';

import '../settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homme-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'To Do List',
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        backgroundColor: MyTheme.primaryLightColor,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: MyTheme.whiteColor, width: 4.2),
            borderRadius: BorderRadius.circular(34)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_list.png'),
                  ),
                  label: 'Task List'),
              BottomNavigationBarItem(
                  icon:
                      ImageIcon(AssetImage('assets/images/icon_settings.png')),
                  label: 'Settings'),

            ],

          ),

        ),
      ),
      body: tabs[selectedIndex],
    );
  }
  List<Widget> tabs= [
    TaskListTab(),SettingsTab()
  ];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddTaskBotoomSheet());
  }
}
