import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:third_lesson_redux/data/item_model.dart';
import 'package:third_lesson_redux/main.dart';
import '../../data/redux_data.dart' as redux;

class MyListCartView extends StatelessWidget {
  const MyListCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<List<ItemModel>, List<ItemModel>>(
        converter: (store) => storeCart.state,
        builder: (context, vm) {
          return ListView.builder(
            itemCount: vm.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(vm[index].label),
                        Text(
                          vm[index].description,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                    StoreConnector<List<ItemModel>, VoidCallback>(
                        converter: (store2) {
                      return () => store2.dispatch(redux.Actions.deleteItem);
                    }, builder: (context, callback) {
                      return MaterialButton(
                        height: 35,
                        minWidth: 35,
                        child: const Icon(
                          Icons.remove,
                        ),
                        onPressed: () {
                          redux.indexDeleteItem = index;
                          callback.call();
                        },
                      );
                    })
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
