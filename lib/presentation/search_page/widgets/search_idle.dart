import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/const_uri.dart';
import 'package:netflix_clone/core/contant.dart';
import 'package:netflix_clone/presentation/search_page/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const MainTitle(tittle: 'Top Searches'),
      kheight,
      Expanded(
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Full Error'),
              );
            } else if (state.idleList.isEmpty) {
              return const Center(
                child: Text('List Empty'),
              );
            }
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  final movie = state.idleList[index];
                  return TopSearchItems(
                      imageUrl: '$imageAppendUrl${movie.posterPath}',
                      title: movie.title ?? 'No title');
                }),
                separatorBuilder: (context, index) => kheight20,
                itemCount: state.idleList.length);
          },
        ),
      )
    ]);
  }
}

class TopSearchItems extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TopSearchItems({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          width: imageSize.width * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: kwhite),
          ),
        ),
        const CircleAvatar(
          radius: 18,
          backgroundColor: kwhite,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: backgroundColor,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhite,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
