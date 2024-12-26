import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todo_provider.dart';

import 'package:todo_app/screens/todo_app.dart';

// main or Entry point of the application!
void main(List<String> args) async {
  // async :
  //  tells Flutter: “This function will take some time to finish.
  //  Let’s handle it without freezing the app.”

  // initialize Hive
  WidgetsFlutterBinding.ensureInitialized();

  // await :
  //  tells Flutter: “Wait here until this task is done,
  //  then move to the next line of code.”
  await Hive.initFlutter();

  // openBox :
  //  tells Flutter: “Open a box named taskBox.”
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('taskBox');

  // runApp :
  //  tells Flutter: “Run this widget as the main widget of the app.”
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //
        // applying dark theme.
        brightness: Brightness.dark,
      ),
      home: TodoApp(),
    );
  }
}
