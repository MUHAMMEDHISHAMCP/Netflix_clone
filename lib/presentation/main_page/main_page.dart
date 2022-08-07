import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/download_page/download_page.dart';
import 'package:netflix_clone/presentation/fastlaugh_page/fast_laugh_page.dart';
import 'package:netflix_clone/presentation/home_page/home_screen.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_navbar.dart';
import 'package:netflix_clone/presentation/new_and_hot_page/new_hot_and_page.dart';
import 'package:netflix_clone/presentation/search_page/search_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final screens = [
    const HomeScreen(),
    const HotAndNewScreen(),
    const FastLaughScreen(),
     SearchScreen(),
    DownloadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexNotifier,
          builder: (context, int index, _) {
            return screens[index];
          }),
      bottomNavigationBar: const BottomNavScreen(),
    );
  }
}
