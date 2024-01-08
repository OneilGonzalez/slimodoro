import 'package:flutter/material.dart';
import 'package:slimodoro/Screens/Start.dart';
import 'package:provider/provider.dart';
import 'package:slimodoro/models/TaskProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slimodoro',
      home: Start(),
    );
  }
}
