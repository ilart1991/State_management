import 'package:flutter/material.dart';
import 'package:third_lesson_ssm/domain/functions.dart';
import 'package:provider/provider.dart';

class MyListCartView extends StatelessWidget {
  const MyListCartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: context.watch<ToTrash>().itemsInCart.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.watch<ToTrash>().itemsInCart[index].label),
                    Text(
                      context.watch<ToTrash>().itemsInCart[index].description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  height: 35,
                  minWidth: 35,
                  child: const Icon(Icons.delete_outline),
                  onPressed: () =>
                      context.read<ToTrash>().removeFromCart(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
