import 'package:flutter/material.dart';

import '../../data/variables.dart';

class MyListItemsView extends StatefulWidget {
  @override
  State<MyListItemsView> createState() => _MyListItemsViewState();
}

class _MyListItemsViewState extends State<MyListItemsView> {
  void _onItemTapped(int index) {
    if (!items[index].inTrash) {
      items[index].inTrash = true;
      itemsInCart.add(items[index]);
    } else {
      items[index].inTrash = false;
      itemsInCart.remove(items[index]);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[index].label),
                    Text(
                      items[index].description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  height: 35,
                  minWidth: 35,
                  child: items[index].inTrash
                      ? const Icon(
                          Icons.done,
                        )
                      : const Icon(
                          Icons.add,
                        ),
                  onPressed: () => _onItemTapped(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
