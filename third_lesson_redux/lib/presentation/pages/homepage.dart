import 'package:flutter/material.dart';
import 'package:third_lesson_redux/data/variables.dart';
import 'package:third_lesson_redux/presentation/widgets/my_list_cart_view.dart';
import 'package:third_lesson_redux/presentation/widgets/my_list_items_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _pages = <Widget>[
    const MyListItemsView(),
    const MyListCartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: tabs, currentIndex: _selectedIndex, onTap: _onBarTapped),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
