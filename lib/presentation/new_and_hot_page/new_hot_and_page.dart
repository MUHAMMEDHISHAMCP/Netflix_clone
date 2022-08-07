import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
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
        body: TabBarView(children: [buildTabBarView(), everyoneWatching()]),
      ),
    );
  }

  Widget buildTabBarView() {
    return ListView.builder(
      itemBuilder: ((context, index) => const ComingSoonWidget()),
      itemCount: 5,
    );
  }

  Widget everyoneWatching() {
    return ListView.builder(
      itemBuilder: ((context, index) => const EveryOneWatching()),
      itemCount: 5,
    );
  }
}
