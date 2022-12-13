import 'package:flutter/material.dart';
import 'package:third_lesson_ssm/domain/functions.dart';
import 'package:third_lesson_ssm/presentation/widgets/my_list_cart_view.dart';
import 'package:third_lesson_ssm/presentation/widgets/my_list_items_view.dart';
import 'package:provider/provider.dart';

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
    List<BottomNavigationBarItem> tabs = [
      const BottomNavigationBarItem(label: "Главная", icon: Icon(Icons.home)),
      BottomNavigationBarItem(
        label: "Корзина",
        icon: Stack(
          children: <Widget>[
            const Icon(Icons.shopping_cart),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 15,
                  minHeight: 15,
                ),
                child: Text(
                  context.watch<ToTrash>().itemsInCart.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    ];

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
