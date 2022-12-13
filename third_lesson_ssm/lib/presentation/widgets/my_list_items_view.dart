import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_lesson_ssm/domain/functions.dart';

class MyListItemsView extends StatelessWidget {
  const MyListItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: context.read<ToTrash>().items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.read<ToTrash>().items[index].label),
                    Text(
                      context.read<ToTrash>().items[index].description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  height: 35,
                  minWidth: 35,
                  child: context.watch<ToTrash>().items[index].inTrash
                      ? const Icon(
                          Icons.done,
                        )
                      : const Icon(
                          Icons.add,
                        ),
                  onPressed: () {
                    context.read<ToTrash>().addRemoveCart(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
