import 'package:flutter/material.dart';

class AddTaskBotoomSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
             Text("Add new Task" ,style: Theme.of(context).primaryTextTheme.headline2,
             textAlign: TextAlign.center,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter task title'
                ),
              ),
          SizedBox(height: 8,),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter task description',

            ),
            maxLines: 4,
            minLines: 4,
          ),
          SizedBox(height: 18,),
          Text('Select Date', style: Theme.of(context).primaryTextTheme.subtitle1,),
          SizedBox(height: 18,),

          InkWell(
            onTap: (){},
              child: Text('2/12/2022' , style: Theme.of(context).primaryTextTheme.subtitle2,textAlign: TextAlign.center,)),
          SizedBox(height: 38,),
          ElevatedButton(onPressed: (){},

              child: Text("Add",style: Theme.of(context).primaryTextTheme.headline1,)
          )
         ],
      ),
    );
  }
}
