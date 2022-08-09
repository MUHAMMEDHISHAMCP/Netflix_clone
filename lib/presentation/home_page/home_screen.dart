import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/const_uri.dart';
import 'package:netflix_clone/core/contant.dart';
import 'package:netflix_clone/presentation/home_page/widgets/numder_card.dart';
import 'package:netflix_clone/presentation/search_page/widgets/title.dart';

import 'widgets/main_list.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, index, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                    return true;
                  },
                  child: Stack(
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state.isError) {
                            return const Center(
                              child: Text('Not get data'),
                            );
                          }

                          final releasedPastYear = state.pastYear.map((p) {
                            return '$imageAppendUrl${p.posterPath}';
                          }).toList();

                          // trending
                          final trending = state.trending.map((t) {
                            return '$imageAppendUrl${t.posterPath}';
                          }).toList();

                          // dramas
                          final dramas = state.trending.map((d) {
                            return '$imageAppendUrl${d.posterPath}';
                          }).toList();

                          // southIndian
                          final southIndian = state.trending.map((s) {
                            return '$imageAppendUrl${s.posterPath}';
                          }).toList();

                          // toptvshows
                          final topTvShows = state.topTvShows.map((t) {
                            return '$imageAppendUrl${t.posterPath}';
                          }).toList();

                          releasedPastYear.shuffle();
                          dramas.shuffle();
                          southIndian.shuffle();

                          return ListView(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_.jpg"))),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          CostumButton(
                                            icon: Icons.add,
                                            title: 'My List',
                                          ),
                                          TextButtonWidget(),
                                          CostumButton(
                                              icon: Icons.info_outline,
                                              title: 'Info')
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              kheight,
                              MainPageList(
                                title: 'Released in the Past Year',
                                posterPath: releasedPastYear,
                              ),
                              kheight,
                              MainPageList(
                                title: 'Trending Now',
                                posterPath: trending,
                              ),
                              kheight,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MainTitle(
                                      tittle: 'Top 10 Tv Shows In India Today'),
                                  kheight,
                                  LimitedBox(
                                    maxHeight: 180,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(
                                          state.topTvShows.length,
                                          (index) => NumberCard(
                                                index: index,
                                                imageUrl: topTvShows,
                                              )),
                                    ),
                                  )
                                ],
                              ),
                              kheight,
                              MainPageList(
                                title: 'Tense Dramas',
                                posterPath: dramas,
                              ),
                              kheight,
                              MainPageList(
                                title: 'South Indian Cinema',
                                posterPath: southIndian,
                              )
                            ],
                          );
                        },
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              height: 90,
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        "https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                        height: 60,
                                        width: 60,
                                      ),
                                      // kwidth,
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.cast),
                                        color: Colors.white,
                                      ),
                                      kwidth,
                                      Container(
                                        color: Colors.blue,
                                        height: 30,
                                        width: 30,
                                      ),
                                      kwidth
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        'Tv Shows',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Movies',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Categories',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : kheight
                    ],
                  ),
                );
              })),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow_rounded,
          size: 25,
          color: Colors.black,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kwhite),
        ));
  }
}

class CostumButton extends StatelessWidget {
  const CostumButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18})
      : super(key: key);
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        )
      ],
    );
  }
}
