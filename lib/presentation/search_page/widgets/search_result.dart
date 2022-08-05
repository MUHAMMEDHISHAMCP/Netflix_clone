import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/contant.dart';
import 'package:netflix_clone/presentation/search_page/widgets/main_card.dart';
import 'package:netflix_clone/presentation/search_page/widgets/title.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(tittle: 'Movies & Tv'),
        kheight,
        Expanded(
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(20, (index) {
                  return const MainShowCard();
                })))
      ],
    );
  }
}
