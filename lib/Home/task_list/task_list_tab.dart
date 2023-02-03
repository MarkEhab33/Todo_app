
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/firebase_utils.dart';
import 'package:todo_app/model/Task.dart';
import 'package:todo_app/Home/task_list/itemTaskWidget.dart';
import 'package:todo_app/MyTheme.dart';

import '../../provider/ListProvider.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {


  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
     listProvider.getAllTasksFromFireStore();
    return  Container(
      child: Column(
        children: [
          CalendarTimeline(

          initialDate: listProvider.selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            listProvider.changeSelectedDate(date);
          },
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: MyTheme.primaryLightColor,
          dotsColor: Colors.transparent,
          selectableDayPredicate: (date) => true,
          locale:  'en_ISO',
            shrink:true,

        ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context,index){
              return TaskItem(task: listProvider.taskList[index],);

            },
         itemCount:listProvider.taskList.length,
            ),
          )
        ],
      ),

    );


  }


}
