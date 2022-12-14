import 'package:flutter/material.dart';
import 'package:third_lesson_bloc/data/bloc_data.dart';
import 'package:third_lesson_bloc/presentation/pages/homepage.dart';

import '../../data/item_model.dart';
import '../../data/variables.dart';

class MyListItemsView extends StatelessWidget {
  const MyListItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ItemModel>>(
        stream: bloc.listState,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data?[index].label ?? items[index].label),
                        Text(
                          snapshot.data?[index].description ??
                              items[index].description,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                    MaterialButton(
                      height: 35,
                      minWidth: 35,
                      child:
                          snapshot.data?[index].inTrash ?? items[index].inTrash
                              ? const Icon(
                                  Icons.done,
                                )
                              : const Icon(
                                  Icons.add,
                                ),
                      onPressed: () {
                        bloc.itemIndex = index;
                        bloc.action.add(BlocEvents.onItemTapped);
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
