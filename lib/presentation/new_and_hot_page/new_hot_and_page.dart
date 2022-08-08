import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/bloc/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/const_uri.dart';
import 'package:netflix_clone/presentation/new_and_hot_page/widgets/coming_soon.dart';
import 'package:netflix_clone/presentation/new_and_hot_page/widgets/every_one.dart';
import 'package:netflix_clone/presentation/widgets/costune_appbar.dart';

class HotAndNewScreen extends StatelessWidget {
  const HotAndNewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              const CostumAppBar(tittle: 'Hot & New'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBar(
                    isScrollable: true,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.black,
                    indicator: BoxDecoration(
                        color: kwhite, borderRadius: BorderRadius.circular(20)),
                    tabs: const [
                      Tab(
                        child: Text(
                          "🍿 Coming Soon",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "👀 Everyone's Watching",
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          ComimgSoonList(
            key: Key('Coming soon list'),
          ),
          EveryOneList(
            key: Key("Every one's watching"),
          )
        ]),
      ),
    );
  }

  // Widget buildTabBarView() {
  //   return ListView.builder(
  //     itemBuilder: ((context, index) => const ComingSoonWidget()),
  //     itemCount: 5,
  //   );
  // }

  // Widget everyoneWatching() {
  //   return ListView.builder(
  //     itemBuilder: ((context, index) => const SizedBox()),
  //     itemCount: 5,
  //   );
  // }
}

class ComimgSoonList extends StatelessWidget {
  const ComimgSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const loadDataInComingSoon());
    });
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.black,
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const loadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Not get data'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text(
                'Videos empty',
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: ((context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                final date = DateTime.parse(movie.releaseDate!);
                final formatedDate = DateFormat.yMMMMd('en_US').format(date);
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase(),
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No totle',
                  description: movie.overview ?? 'No description',
                );
              }),
              itemCount: state.comingSoonList.length,
            );
          }
        },
      ),
    );
  }
}

class EveryOneList extends StatelessWidget {
  const EveryOneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const loadDataInEveryOne());
    });
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.black,
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(const loadDataInEveryOne());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Not get data'),
            );
          } else if (state.everyOneList.isEmpty) {
            return const Center(
              child: Text(
                'Videos empty',
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: ((context, index) {
                final tv = state.everyOneList[index];
                if (tv.id == null) {
                  return const SizedBox();
                }

                return EveryOneWatching(
                    posterPath: '$imageAppendUrl${tv.posterPath}',
                    movieName: tv.originalName ?? 'No Name',
                    discription: tv.overview ?? 'No description');
              }),
              itemCount: state.everyOneList.length,
            );
          }
        },
      ),
    );
  }
}
