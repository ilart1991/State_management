import 'package:flutter/material.dart';
import 'package:third_lesson_ssm/data/item_model.dart';

class ToTrash with ChangeNotifier {
  List<ItemModel> items = [
    ItemModel("Брюки", "Синие в крапинку", false),
    ItemModel("Рубашка", "Красная в горошек", false),
    ItemModel("Туфли", "Черные в полоску", false),
    ItemModel("Шапка", "Детская с бубончиком", false),
    ItemModel("Галстук", "Оранжевый в ромбики", false),
    ItemModel("Пуговицы", "Мощные супергеройские", false),
    ItemModel("Майка", "Стильная меховая", false),
    ItemModel("Пиджак", "Тот самый без рукавов", false),
    ItemModel("Свитер", "Как у того парня", false),
    ItemModel("Шарф", "Вкусный черничный", false),
    ItemModel("Носки", "Грустные черного цвета", false),
  ];

  List<ItemModel> itemsInCart = [];

  void addRemoveCart(int index) {
    if (!items[index].inTrash) {
      items[index].inTrash = true;
      itemsInCart.add(items[index]);
    } else {
      items[index].inTrash = false;
      itemsInCart.remove(items[index]);
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    for (int i = 0; i < items.length; i++) {
      if (itemsInCart[index] == items[i]) {
        items[i].inTrash = false;
      }
    }
    itemsInCart.removeAt(index);
    notifyListeners();
  }
}
