import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/search_page/widgets/title.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';

class MainPageList extends StatelessWidget {
  final String title;
  const MainPageList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(tittle: title),
          LimitedBox(
            maxHeight: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => const MainCard()),
            ),
          )
        ],
      ),
    );
  }
}
