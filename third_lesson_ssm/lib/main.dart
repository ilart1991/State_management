import 'package:flutter/material.dart';
import 'package:third_lesson_ssm/presentation/pages/homepage.dart';
import 'package:third_lesson_ssm/domain/functions.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToTrash>(
      create: (_) => ToTrash(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'e-commerce simple SM'),
      ),
    );
  }
}
