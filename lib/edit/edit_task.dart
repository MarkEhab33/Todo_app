import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/firebase_utils.dart';
import 'package:todo_app/provider/ListProvider.dart';

import '../model/Task.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName ='edit_task';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  var titleController=TextEditingController();
  var descriptionController= TextEditingController();
   late Task task;
 @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      task = ModalRoute.of(context)?.settings.arguments as Task;
      titleController.text=task.title;
      descriptionController.text= task.description;
      selectedDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'To Do List',
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(color: Theme.of(context).primaryColor,height: screenSize.height*0.1,),
              Center(
                child: Container(
                  height: screenSize.height*0.7,
                  width: screenSize.width*0.8,
                  margin: EdgeInsets.only(
                      top:screenSize.width*0.04
                  ),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                 

                  child: Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Text("Edit Task" ,style: Theme.of(context).primaryTextTheme.headline2,
                  textAlign: TextAlign.center,),
                  Form(
                  key: formKey,
                  child: Column(
                  children: [
                  TextFormField(
                  decoration: InputDecoration(
                         hintText: 'Enter task title'
                      ),
                       controller: titleController,
                      validator: (text){
                       if(text== null || text.isEmpty){
                           return 'Please enter Task Title';
                                 }

                           return null;
                          },
                         ),
                   SizedBox(height: 8,),
                   TextFormField(
                       decoration: InputDecoration(
                          hintText: 'Enter task description',

              ),
                   controller: descriptionController,
                     validator: (text){
              if(text== null || text.isEmpty){
              return 'Please enter Task description';
              }

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
                             ElevatedButton(
                                 onPressed: (){
                                 if(formKey.currentState!.validate()){
                                   task.title=titleController.text;
                                   task.description=descriptionController.text;
                                   task.date=selectedDate.millisecondsSinceEpoch;
                                   Provider.of<ListProvider>(context,listen: false).updateTask(task);
                                   }
                                   Navigator.of(context).pop();

                             },

                             child: Text('Save changes',style: Theme.of(context).primaryTextTheme.headline1,)
              )
              ],
              ),
                ),
              ),
              ),
            ],
          ),
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
      setState(() {});
    }
  }
}
