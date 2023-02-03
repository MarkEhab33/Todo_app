import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/firebase_utils.dart';
import 'package:todo_app/MyTheme.dart';
import 'package:todo_app/edit/edit_task.dart';
import 'package:todo_app/provider/ListProvider.dart';

import '/model/Task.dart';


class TaskItem extends StatelessWidget {

   Task task  ;
   TaskItem({required this.task});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).pushNamed(EditTaskScreen.routeName,arguments: task),
      child: Container(

        margin: EdgeInsets.only(left: 18,right: 0),
        child: Slidable(
          key: const ValueKey(0),

          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

             extentRatio: 0.25,
            // All actions are defined in the children parameter.
            children:  [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context){
                    deleteTaskFromFireStore(task).timeout(Duration(milliseconds: 5),onTimeout:(){
                      print('task was deleted successfully');
                    } );
                },
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(14)),
                backgroundColor: MyTheme.redColor ,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),

            ],
          ),
          child: Container(
            margin: EdgeInsets.only(right: 15,top: 15,bottom: 15),
            decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(18),
              color: MyTheme.whiteColor
            ),
            child: Row(

              children: [
                Container(
                  margin: EdgeInsets.all(18),
                  color: task.isDone? MyTheme.greenColor:Theme.of(context).primaryColor,
                  height: 80,
                  width: 3,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${task.title}',style: task.isDone?Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: MyTheme.greenColor):Theme.of(context).primaryTextTheme.bodyText1),
                      Text('${task.description}',style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(fontWeight: FontWeight.w500))
                    ],
                  ),
                ),

                InkWell(
                  onTap: (){
                    Provider.of<ListProvider>(context,listen:false ).editIsDone(task);
                  },
                  child: task.isDone? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Done!',style: TextStyle(fontSize: 22,color: MyTheme.greenColor,fontWeight: FontWeight.bold),),
                  ):
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).primaryColor,
                    ),
                    margin: EdgeInsets.all(15),
                    height: 35,
                    width: 65,
                    child: Icon(Icons.check,color: Colors.white,size: 30,),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
