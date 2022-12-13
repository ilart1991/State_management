import 'package:flutter/material.dart';

List<BottomNavigationBarItem> tabs = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Главная"),
  const BottomNavigationBarItem(icon: Icon(Icons.list), label: "Корзина")
];

class ItemModel {
  String label;
  String description;
  bool inTrash;

  ItemModel(this.label, this.description, this.inTrash);
}

List<ItemModel> items = [
  ItemModel("Брюки", "Синие в крапинку", false),
  ItemModel("Рубашка", "Красная в горошек", false),
  ItemModel("Туфли", "Черные в полоску", false),
  ItemModel("Шапка", "Детская с бубончиком", false),
  ItemModel("Галстук", "Оранжевый в ромбики", false),
  ItemModel("Пуговицы", "Мощные супергеройские", false),
  ItemModel("Майка", "Стильная меховая", false),
  ItemModel("Пиджак", "Тот самый без рукавов", false),
];

List<ItemModel> itemsInCart = [];
