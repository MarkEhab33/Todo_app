

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/HomeScreen.dart';
import 'package:todo_app/MyTheme.dart';
import 'package:todo_app/edit/edit_task.dart';
import 'package:todo_app/provider/ListProvider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();

  runApp(
      ChangeNotifierProvider(
    create: (context)=> ListProvider( ),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        HomeScreen.routeName :(context)=> HomeScreen(),
        EditTaskScreen.routeName:(context)=>EditTaskScreen(),
      } ,
      initialRoute: HomeScreen.routeName ,
      theme: MyTheme.lightTheme  ,
    );
  }
}

