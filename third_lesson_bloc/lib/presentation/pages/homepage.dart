import 'package:flutter/material.dart';
import 'package:third_lesson_bloc/data/bloc_data.dart';
import 'package:third_lesson_bloc/data/variables.dart';
import 'package:third_lesson_bloc/presentation/widgets/my_list_cart_view.dart';
import 'package:third_lesson_bloc/presentation/widgets/my_list_items_view.dart';

final Bloc bloc = Bloc();

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});
  final String title;
  static final List<Widget> _pages = <Widget>[
    const MyListItemsView(),
    MyListCartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.pageState,
      initialData: 0,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: tabs,
            currentIndex: snapshot.data!,
            onTap: (value) {
              bloc.pageIndex = value;
              bloc.action.add(BlocEvents.changePage);
            },
          ),
          body: HomePage._pages.elementAt(snapshot.data!),
        );
      },
    );
  }
}
