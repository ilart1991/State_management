import 'package:flutter/material.dart';
import 'package:third_lesson_cubit/data/bloc_data.dart';
import 'package:third_lesson_cubit/data/variables.dart';
import 'package:third_lesson_cubit/presentation/widgets/my_list_cart_view.dart';
import 'package:third_lesson_cubit/presentation/widgets/my_list_items_view.dart';

final Bloc bloc = Bloc();

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;
  static final List<Widget> _pages = <Widget>[
    const MyListItemsView(),
    const MyListCartView(),
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
              bloc.changePage();
            },
          ),
          body: HomePage._pages.elementAt(snapshot.data!),
        );
      },
    );
  }
}
