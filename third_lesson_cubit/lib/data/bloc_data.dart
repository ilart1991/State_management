import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:third_lesson_cubit/data/variables.dart';
import 'item_model.dart';

class Bloc {
  int itemIndex = 0;
  int pageIndex = 0;

  final StreamController<List<ItemModel>> _listStateController =
      BehaviorSubject<List<ItemModel>>();
  final StreamController<int> _pageStateController = BehaviorSubject<int>();

  Stream<List<ItemModel>> get listState => _listStateController.stream;
  Stream<int> get pageState => _pageStateController.stream;

  void dispose() {
    _listStateController.close();
    _pageStateController.close();
  }

  void onItemTap() {
    if (!items[itemIndex].inTrash) {
      items[itemIndex].inTrash = true;
      itemsInCart.add(items[itemIndex]);
    } else {
      items[itemIndex].inTrash = false;
      itemsInCart.remove(items[itemIndex]);
    }
    _listStateController.add(items);
  }

  void changePage() {
    _pageStateController.add(pageIndex);
  }
}
