import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Home/firebase_utils.dart';
import '../model/Task.dart';

class ListProvider extends ChangeNotifier{
  List<Task> taskList =[];
  DateTime selectedDate = DateTime.now();
  getAllTasksFromFireStore() async{
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get() as QuerySnapshot<Task>;
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList().where((task){
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(task.date);
      if(dateTime.year==selectedDate.year && dateTime.month==selectedDate.month&& dateTime.day==selectedDate.day){
        return true;
      }
      return false;
    }).toList();

    taskList.sort((task1,task2){
      DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return dateTime1.compareTo(dateTime2);
    });
   notifyListeners();
  }
  void changeSelectedDate(DateTime newDate){
    selectedDate = newDate;
    notifyListeners();
  }
  void editIsDone(Task task){
         editIsDoneInFirebase(task);
  }
  void updateTask(Task task){
    updateTaskInFirebase(task);
  }
}