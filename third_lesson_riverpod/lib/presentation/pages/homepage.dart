import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/functions.dart';

final pagesProvider = ChangeNotifierProvider((ref) => PagesNotifier());
int selectedIndex = 0;

List<BottomNavigationBarItem> tabs = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Главная"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart), label: "Корзина")
];

class HomePage extends ConsumerWidget {
  HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        bottomNavigationBar: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final pagesNotifier = ref.watch(pagesProvider);
            return BottomNavigationBar(
              items: tabs,
              currentIndex: selectedIndex,
              onTap: (value) {
                pagesNotifier.onBarTapped(value);
              },
            );
          },
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final pagesNotifier = ref.watch(pagesProvider);
            return pagesNotifier.pages2.elementAt(selectedIndex);
          },
        ));
  }
}
