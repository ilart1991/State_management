import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:third_lesson_redux/data/item_model.dart';

import '../../data/redux_data.dart' as redux;

class MyListItemsView extends StatelessWidget {
  const MyListItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<List<ItemModel>, List<ItemModel>>(
        converter: (store) => store.state,
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
                      converter: (store) {
                        return () => store.dispatch(redux.Actions.onItemTap);
                      },
                      builder: (context, callback) {
                        return MaterialButton(
                            height: 35,
                            minWidth: 35,
                            child: vm[index].inTrash
                                ? const Icon(
                                    Icons.done,
                                  )
                                : const Icon(
                                    Icons.add,
                                  ),
                            onPressed: () {
                              redux.indexOnItemTap = index;
                              callback.call();
                            });
                      },
                    ),
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
