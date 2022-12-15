import 'package:flutter/material.dart';
import 'package:third_lesson_mobx/presentation/pages/homepage.dart';
import 'package:provider/provider.dart';

import 'domain/mobx_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider<MobXState>(
      create: (context) => MobXState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'e-commerce mobx'),
      ),
    );
  }
}
