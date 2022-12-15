// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobXState on _MobXState, Store {
  late final _$mobItemsAtom =
      Atom(name: '_MobXState.mobItems', context: context);

  @override
  List<ItemModel> get mobItems {
    _$mobItemsAtom.reportRead();
    return super.mobItems;
  }

  @override
  set mobItems(List<ItemModel> value) {
    _$mobItemsAtom.reportWrite(value, super.mobItems, () {
      super.mobItems = value;
    });
  }

  late final _$mobItemsInCartAtom =
      Atom(name: '_MobXState.mobItemsInCart', context: context);

  @override
  List<ItemModel> get mobItemsInCart {
    _$mobItemsInCartAtom.reportRead();
    return super.mobItemsInCart;
  }

  @override
  set mobItemsInCart(List<ItemModel> value) {
    _$mobItemsInCartAtom.reportWrite(value, super.mobItemsInCart, () {
      super.mobItemsInCart = value;
    });
  }

  late final _$_MobXStateActionController =
      ActionController(name: '_MobXState', context: context);

  @override
  void onItemTapped(int index) {
    final _$actionInfo = _$_MobXStateActionController.startAction(
        name: '_MobXState.onItemTapped');
    try {
      return super.onItemTapped(index);
    } finally {
      _$_MobXStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem(int index) {
    final _$actionInfo =
        _$_MobXStateActionController.startAction(name: '_MobXState.deleteItem');
    try {
      return super.deleteItem(index);
    } finally {
      _$_MobXStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mobItems: ${mobItems},
mobItemsInCart: ${mobItemsInCart}
    ''';
  }
}
