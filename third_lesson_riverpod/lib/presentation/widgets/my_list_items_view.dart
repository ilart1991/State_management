import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/functions.dart';

final listsProvider = ChangeNotifierProvider((ref) => ListsNotifier());

class MyListItemsView extends ConsumerWidget {
  const MyListItemsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final listNotifier = ref.watch(listsProvider);
          return ListView.builder(
            itemCount: listNotifier.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listNotifier.items[index].label),
                        Text(
                          listNotifier.items[index].description,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                    MaterialButton(
                      height: 35,
                      minWidth: 35,
                      child: listNotifier.items[index].inTrash
                          ? const Icon(
                              Icons.done,
                            )
                          : const Icon(
                              Icons.add,
                            ),
                      onPressed: () {
                        listNotifier.onItemTapped(index);
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
