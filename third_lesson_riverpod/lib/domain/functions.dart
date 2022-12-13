import 'package:flutter/material.dart';
import '../data/item_model.dart';
import '../presentation/pages/homepage.dart';
import '../presentation/widgets/my_list_cart_view.dart';
import '../presentation/widgets/my_list_items_view.dart';

class PagesNotifier extends ChangeNotifier {
  final List<Widget> _pages2 = <Widget>[
    const MyListItemsView(),
    const MyListCartView(),
  ];

  List<Widget> get pages2 => _pages2;

  void onBarTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class ListsNotifier extends ChangeNotifier {
  final List<ItemModel> _items = [
    ItemModel("Брюки", "Синие в крапинку", false),
    ItemModel("Рубашка", "Красная в горошек", false),
    ItemModel("Туфли", "Черные в полоску", false),
    ItemModel("Шапка", "Детская с бубончиком", false),
    ItemModel("Галстук", "Оранжевый в ромбики", false),
    ItemModel("Пуговицы", "Мощные супергеройские", false),
    ItemModel("Майка", "Стильная меховая", false),
    ItemModel("Пиджак", "Тот самый без рукавов", false),
  ];
  List<ItemModel> get items => _items;

  void onItemTapped(int index) {
    if (!_items[index].inTrash) {
      _items[index].inTrash = true;
      _itemsInCart.add(_items[index]);
    } else {
      _items[index].inTrash = false;
      _itemsInCart.remove(_items[index]);
    }
    notifyListeners();
  }

  final List<ItemModel> _itemsInCart = [];
  List<ItemModel> get itemsInCart => _itemsInCart;

  void deleteItem(int index) {
    for (int i = 0; i < _items.length; i++) {
      if (_itemsInCart[index] == _items[i]) {
        _itemsInCart[index].inTrash = false;
        _items[i].inTrash == false;
      }
    }
    _itemsInCart.removeAt(index);
    notifyListeners();
  }
}
