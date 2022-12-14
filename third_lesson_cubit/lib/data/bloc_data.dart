import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:third_lesson_cubit/data/variables.dart';
import 'item_model.dart';

enum BlocEvents { onItemTapped, changePage }

class Bloc {
  int itemIndex = 0;
  int pageIndex = 0;

  final StreamController<List<ItemModel>> _listStateController =
      BehaviorSubject<List<ItemModel>>();
  final StreamController<int> _pageStateController = BehaviorSubject<int>();

  final _eventsController = StreamController<BlocEvents>();

  Stream<List<ItemModel>> get listState => _listStateController.stream;
  Stream<int> get pageState => _pageStateController.stream;

  Sink<BlocEvents> get action => _eventsController.sink;

  Bloc() {
    _eventsController.stream.listen(_handleEvent);
  }

  void dispose() {
    _listStateController.close();
    _pageStateController.close();
    _eventsController.close();
  }

  void _handleEvent(BlocEvents action) async {
    if (action == BlocEvents.onItemTapped) {
      if (!items[itemIndex].inTrash) {
        items[itemIndex].inTrash = true;
        itemsInCart.add(items[itemIndex]);
      } else {
        items[itemIndex].inTrash = false;
        itemsInCart.remove(items[itemIndex]);
      }

      _listStateController.add(items);
    } else if (action == BlocEvents.changePage) {
      _pageStateController.add(pageIndex);
    }
  }
}
