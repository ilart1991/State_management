import 'package:mobx/mobx.dart';
import 'package:third_lesson_mobx/data/item_model.dart';
import 'package:third_lesson_mobx/data/variables.dart';

part 'mobx_state.g.dart';

class MobXState = _MobXState with _$MobXState;

abstract class _MobXState with Store {
  @observable
  List<ItemModel> mobItems = items;

  @observable
  List<ItemModel> mobItemsInCart = itemsInCart;

  @action
  void onItemTapped(int index) {
    if (!mobItems[index].inTrash) {
      mobItems[index].inTrash = true;
      itemsInCart.add(mobItems[index]);
    } else {
      mobItems[index].inTrash = false;
      itemsInCart.remove(mobItems[index]);
    }
    mobItems = mobItems;
  }

  @action
  void deleteItem(int index) {
    for (int i = 0; i < mobItems.length; i++) {
      if (mobItemsInCart[index] == mobItems[i]) {
        mobItems[i].inTrash = false;
      }
    }
    mobItemsInCart.removeAt(index);
    mobItemsInCart = mobItemsInCart;
  }
}
