import 'package:flutter/cupertino.dart';

class MainShowCard extends StatelessWidget {
  const MainShowCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg",
              )),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
