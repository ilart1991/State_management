import 'package:flutter/material.dart';

import '../presentation/pages/homepage.dart';
import '../presentation/widgets/my_list_cart_view.dart';
import '../presentation/widgets/my_list_items_view.dart';

class PagesNotifier extends ChangeNotifier {
  final List<Widget> _pages = <Widget>[
    const MyListItemsView(),
    const MyListCartView(),
  ];

  List<Widget> get pages => _pages;

  void onBarTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
