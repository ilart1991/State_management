import 'package:flutter/material.dart';

import 'item_model.dart';

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
