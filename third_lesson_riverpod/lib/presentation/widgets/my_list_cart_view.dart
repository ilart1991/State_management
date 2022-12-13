import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'my_list_items_view.dart';

class MyListCartView extends ConsumerWidget {
  const MyListCartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final listNotifier = ref.watch(listsProvider);
          return ListView.builder(
            itemCount: listNotifier.itemsInCart.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listNotifier.itemsInCart[index].label),
                        Text(
                          listNotifier.itemsInCart[index].description,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                    MaterialButton(
                        height: 35,
                        minWidth: 35,
                        child: const Icon(
                          Icons.remove_shopping_cart_outlined,
                        ),
                        onPressed: () {
                          listNotifier.deleteItem(index);
                        }),
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
