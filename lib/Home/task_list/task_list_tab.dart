import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Home/task_list/itemTaskWidget.dart';
import 'package:todo_app/MyTheme.dart';

class TaskListTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          CalendarTimeline(

          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
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
              return TaskItem();

            },
         itemCount:20,
            ),
          )
        ],
      ),

    );
  }
}
