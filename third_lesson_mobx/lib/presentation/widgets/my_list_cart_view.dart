import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/mobx_state.dart';

class MyListCartView extends StatelessWidget {
  const MyListCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final diceCounter = Provider.of<MobXState>(context);
    return Scaffold(
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: diceCounter.mobItemsInCart.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(diceCounter.mobItemsInCart[index].label),
                        Text(
                          diceCounter.mobItemsInCart[index].description,
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
                          Icons.remove,
                        ),
                        onPressed: () {
                          diceCounter.deleteItem(index);
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
