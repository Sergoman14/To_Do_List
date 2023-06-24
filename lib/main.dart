import 'package:flutter/material.dart';
import 'package:to_do_list/theme/app_theme.dart';
import 'package:to_do_list/theme/elements_color.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      debugShowCheckedModeBanner: false,
      darkTheme: TodoTheme.dark(),
      theme: TodoTheme.light(),
      home: const HomePage(),
    );
  }
}
