import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:third_lesson_redux/data/item_model.dart';
import 'package:third_lesson_redux/data/variables.dart';
import 'package:third_lesson_redux/presentation/pages/homepage.dart';

import 'data/redux_data.dart';
import 'package:flutter_redux/flutter_redux.dart';

final storeItems = Store<List<ItemModel>>(reducer, initialState: items);
final storeCart = Store<List<ItemModel>>(reducer, initialState: itemsInCart);
void main() {
  runApp(MyApp(
    store: storeItems,
  ));
}

class MyApp extends StatelessWidget {
  final Store<List<ItemModel>> store;
  const MyApp({super.key, required this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<ItemModel>>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'e-commerce redux'),
      ),
    );
  }
}
