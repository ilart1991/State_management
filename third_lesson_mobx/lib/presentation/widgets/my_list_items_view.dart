import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/mobx_state.dart';

class MyListItemsView extends StatelessWidget {
  const MyListItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final diceCounter = Provider.of<MobXState>(context);
    return Scaffold(
        body: ListView.builder(
      itemCount: diceCounter.mobItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(diceCounter.mobItems[index].label),
                  Text(
                    diceCounter.mobItems[index].description,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
              const Spacer(),
              MaterialButton(
                height: 35,
                minWidth: 35,
                child: Observer(
                  builder: (_) => diceCounter.mobItems[index].inTrash
                      ? const Icon(
                          Icons.done,
                        )
                      : const Icon(
                          Icons.add,
                        ),
                ),
                onPressed: () => diceCounter.onItemTapped(index),
              ),
            ],
          ),
        );
      },
    ));
  }
}
