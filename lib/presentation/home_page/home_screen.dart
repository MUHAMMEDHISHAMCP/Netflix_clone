import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/contant.dart';
import 'package:netflix_clone/presentation/home_page/widgets/numder_card.dart';
import 'package:netflix_clone/presentation/search_page/widgets/title.dart';

import 'widgets/main_list.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      ListView(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.7,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://m.media-amazon.com/images/M/MV5BMjllYTdiYmItZWYzYy00MDBlLWJjMDAtZjNlMzdkZjk1Mjc3XkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_.jpg"))),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
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
                          const MainPageList(
                            title: 'Released in the Past Year',
                          ),
                          kheight,
                          const MainPageList(
                            title: 'Trending Now',
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
                                      10,
                                      (index) => NumberCard(
                                            index: index,
                                          )),
                                ),
                              )
                            ],
                          ),
                          kheight,
                          const MainPageList(title: 'Tense Dramas'),
                          kheight,
                          const MainPageList(title: 'South Indian Cinema')
                        ],
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
