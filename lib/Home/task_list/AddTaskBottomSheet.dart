import 'package:flutter/material.dart';
import 'package:todo_app/Home/firebase_utils.dart';

import '/model/Task.dart';

class AddTaskBotoomSheet extends StatefulWidget {


  @override
  State<AddTaskBotoomSheet> createState() => _AddTaskBotoomSheetState();
}

class _AddTaskBotoomSheetState extends State<AddTaskBotoomSheet> {
  String title ='';
  String description ='';
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
             Text("Add new Task" ,style: Theme.of(context).primaryTextTheme.headline2,
             textAlign: TextAlign.center,),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter task title'
                      ),
                      validator: (text){
                        if(text== null || text.isEmpty){
                          return 'Please enter Task Title';
                        }
                        title=text;
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter task description',

                      ),
                      validator: (text){
                        if(text== null || text.isEmpty){
                          return 'Please enter Task description';
                        }
                        description=text;
                        return null;
                      },
                      maxLines: 4,
                      minLines: 4,
                    ),

                  ],
                ),
              ),

          SizedBox(height: 18,),
          Text('Select Date', style: Theme.of(context).primaryTextTheme.subtitle1,),
          SizedBox(height: 18,),
          InkWell(
            onTap: (){
              selectDate();
            },
              child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}' , style: Theme.of(context).primaryTextTheme.subtitle2,textAlign: TextAlign.center,)),
          SizedBox(height: 38,),
          ElevatedButton(onPressed: (){
            addTask();
          },

              child: Text("Add",style: Theme.of(context).primaryTextTheme.headline1,)
          )
         ],
      ),
    );
  }

  void selectDate() async{
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))) ;

    if (chosenDate!= null){
      selectedDate = chosenDate;
      setState(() {

      });
     }
  }

  void addTask() {
    if(formKey.currentState?.validate() ==true){
       Task task = Task(
         title:title,
         description:description,
         date: selectedDate.millisecondsSinceEpoch

       );
       addTaskToFireStore(task).timeout(Duration(milliseconds: 500),onTimeout:(){
         print('task was added successfully');
         Navigator.pop(context);
       }  );
    }
  }
}
