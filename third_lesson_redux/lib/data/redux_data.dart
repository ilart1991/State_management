import 'package:third_lesson_redux/data/item_model.dart';
import 'package:third_lesson_redux/data/variables.dart';

enum Actions { onItemTap, deleteItem }

int indexOnItemTap = 0;
int indexDeleteItem = 0;

List<ItemModel> reducer(List<ItemModel> state, dynamic action) {
  if (action == Actions.onItemTap) {
    if (!items[indexOnItemTap].inTrash) {
      items[indexOnItemTap].inTrash = true;
      itemsInCart.add(items[indexOnItemTap]);
    } else {
      items[indexOnItemTap].inTrash = false;
      itemsInCart.remove(items[indexOnItemTap]);
    }
    return items;
  } else if (action == Actions.deleteItem) {
    for (int i = 0; i < items.length; i++) {
      if (itemsInCart[indexDeleteItem] == items[i]) {
        itemsInCart[indexDeleteItem].inTrash = false;
        items[i].inTrash == false;
      }
    }
    itemsInCart.removeAt(indexDeleteItem);
    return items;
  } else {
    return items;
  }
}
