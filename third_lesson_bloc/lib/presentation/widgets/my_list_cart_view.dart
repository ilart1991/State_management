import 'package:flutter/material.dart';
import 'package:third_lesson_bloc/data/variables.dart';

class MyListCartView extends StatelessWidget {
  const MyListCartView({super.key});

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
              ],
            ),
          );
        },
      ),
    );
  }
}
