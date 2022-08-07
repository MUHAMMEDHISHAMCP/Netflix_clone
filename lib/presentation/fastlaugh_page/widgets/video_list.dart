import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/const_uri.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

class VideoListInherit extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListInherit(
      {Key? key, required this.movieData, required this.widget})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListInherit oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListInherit? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoListInherit>();
  }
}

class VideoList extends StatelessWidget {
  const VideoList({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final posterPath = VideoListInherit.of(context)?.movieData.posterPath;
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.volume_off)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage(
                                '$imageAppendUrl$posterPath',
                              ),
                        radius: 30,
                      ),
                    ),
                    const VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                    const VideoActions(icon: Icons.add, title: 'My List'),
                    const VideoActions(icon: Icons.share, title: 'Share'),
                    const VideoActions(icon: Icons.play_arrow, title: 'Play')
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActions({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhite,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
