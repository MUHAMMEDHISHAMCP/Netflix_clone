import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/const_uri.dart';
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
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return MainShowCard(
                    imageUrl: '$imageAppendUrl${movie.posterPath}',
                  );
                }));
          },
        ))
      ],
    );
  }
}
