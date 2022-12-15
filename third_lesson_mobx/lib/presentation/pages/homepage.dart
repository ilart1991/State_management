import 'package:flutter/material.dart';
import 'package:third_lesson_mobx/data/variables.dart';
import 'package:third_lesson_mobx/presentation/widgets/my_list_cart_view.dart';
import 'package:third_lesson_mobx/presentation/widgets/my_list_items_view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  final String title;

  static final List<Widget> _pages = <Widget>[
    MyListItemsView(),
    MyListCartView(),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: tabs, currentIndex: _selectedIndex, onTap: _onBarTapped),
      body: HomePage._pages.elementAt(_selectedIndex),
    );
  }
}
