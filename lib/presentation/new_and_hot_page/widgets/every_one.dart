import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home_page/home_screen.dart';

import '../../../core/contant.dart';
import '../../widgets/video_widget.dart';

class EveryOneWatching extends StatelessWidget {
  const EveryOneWatching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Friends',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          kheight,
          const Text(
            "The movie is an excellent take on the life and times of Kaduvakkunnel Kuruvachan. The script claims to represent Pala of the 90s and painstakingly avoids elements such as mobile phones. Therefore, it is absolutely natural and imperative for the director to stick to a 90s formula anything otherwise would have looked out of the way. Prithviraj shines as the protagonist. Emotions of shock, digust, anger, ",
            style: TextStyle(color: Colors.grey),
          ),
          kheight40,
          const VideoWidget(),
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
