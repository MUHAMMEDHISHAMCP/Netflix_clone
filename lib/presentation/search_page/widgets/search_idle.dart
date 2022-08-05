import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
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
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) => const TopSearchItems()),
            separatorBuilder: (context, index) => kheight20,
            itemCount: 10),
      )
    ]);
  }
}

class TopSearchItems extends StatelessWidget {
  const TopSearchItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          width: imageSize.width * 0.35,
          height: 65,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.nowrunning.com/content/movie/2020/kaduv-24597/Stills/kaduva5_2022620.jpg"))),
        ),
        kwidth,
        const Expanded(
          child: Text(
            'MovieName',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: kwhite),
          ),
        ),
        const CircleAvatar(
          radius: 25,
          backgroundColor: kwhite,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: backgroundColor,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhite,
            ),
          ),
        ),
      ],
    );
  }
}
