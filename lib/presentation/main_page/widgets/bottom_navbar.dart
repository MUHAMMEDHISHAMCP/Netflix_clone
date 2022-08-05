import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, int newInex, _) {
          return BottomNavigationBar(
              currentIndex: newInex,
              onTap: (index) {
                indexNotifier.value = index;
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: backgroundColor,
              // selectedIconTheme: IconThemeData(color: Colors.white),
              //       unselectedIconTheme: IconThemeData(color: Colors.grey),

              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections_outlined), label: 'New & Hot'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_circle_down_outlined),
                    label: 'Downloads')
              ]);
        });
  }
}
