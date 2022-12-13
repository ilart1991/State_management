import 'package:flutter/material.dart';
import 'package:third_lesson_riverpod/data/variables.dart';

class MyListCartView extends StatefulWidget {
  @override
  State<MyListCartView> createState() => _MyListCartViewState();
}

class _MyListCartViewState extends State<MyListCartView> {
  // void _deleteItem(int index) {
  //   for (int i = 0; i < items.length; i++) {
  //     if (itemsInCart[index] == items[i]) {
  //       items[i].inTrash == false;
  //     }
  //   }

  //   itemsInCart.removeAt(index);

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: itemsInCart.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemsInCart[index].label),
                    Text(
                      itemsInCart[index].description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
                // const Spacer(),
                // CircleAvatar(
                //   radius: 20,
                //   child: MaterialButton(
                //     child: itemsInCart[index].inTrash
                //         ? const Icon(
                //             Icons.done,
                //             color: Colors.white,
                //           )
                //         : const Icon(
                //             Icons.add,
                //             color: Colors.white,
                //           ),
                //     onPressed: () => _deleteItem(index),
                //   ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
