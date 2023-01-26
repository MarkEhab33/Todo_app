import 'package:flutter/material.dart';
import 'package:todo_app/Home/HomeScreen.dart';
import 'package:todo_app/MyTheme.dart';

void main() {
  runApp(const MyApp());
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
      } ,
      initialRoute: HomeScreen.routeName ,
      theme: MyTheme.lightTheme  ,
    );
  }
}

