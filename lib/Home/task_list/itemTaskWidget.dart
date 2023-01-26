import 'package:flutter/material.dart';
import 'package:todo_app/MyTheme.dart';

class TaskItem extends StatefulWidget {

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(18),
        color: MyTheme.whiteColor
      ),
      child: Row(
        
        children: [
          Container(
            margin: EdgeInsets.all(18),
            color: Theme.of(context).primaryColor,
            height: 80,
            width: 3,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Task Title',style: Theme.of(context).primaryTextTheme.bodyText1),
                Text('Description',style: Theme.of(context).primaryTextTheme.subtitle1)
              ],
            ),
          ),
          
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor,
            ),
            margin: EdgeInsets.all(15),
            height: 35,
            width: 65,
            child: Icon(Icons.check,color: Colors.white,size: 30,),
          )

        ],
      ),
    );
  }
}
