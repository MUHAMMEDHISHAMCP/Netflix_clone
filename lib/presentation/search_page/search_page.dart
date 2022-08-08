import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/contant.dart';
import 'package:netflix_clone/domain/downloads/core/debouncer.dart';
import 'package:netflix_clone/presentation/search_page/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search_page/widgets/search_result.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final debouncer = Debouncer(millseconds: 1 * 1000);
 
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const initial());
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.white.withOpacity(0.3),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(searchMovies(movieQuery: value));
                });
                // BlocProvider.of<SearchBloc>(context)
                //     .add(searchMovies(movieQuery: value));
              },
            ),
            kheight,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return const SearchIdleWidget();
                } else {
                  return const SearchResultScreen();
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
