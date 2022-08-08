import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home_page/home_screen.dart';

import '../../../core/contant.dart';
import '../../widgets/video_widget.dart';

class EveryOneWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String discription;

  const EveryOneWatching({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.discription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(movieName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          kheight,
           Text(
           discription,
            style: const TextStyle(color: Colors.grey),
          ),
          kheight40,
           VideoWidget(imageUrl: posterPath,),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CostumButton(
                icon: Icons.share,
                title: 'Share',
                iconSize: 25,
                textSize: 15,
              ),
              kwidth,
              CostumButton(
                icon: Icons.add,
                title: 'My List',
                iconSize: 25,
                textSize: 15,
              ),
              kwidth,
              CostumButton(
                icon: Icons.play_arrow_rounded,
                title: 'Play',
                iconSize: 25,
                textSize: 15,
              ),
              kwidth
            ],
          ),
          kheight20
        ],
      ),
    );
  }
}
