import 'package:flutter/material.dart';
import 'package:netflix_clone/application/fastlaugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/const_uri.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:video_player/video_player.dart';

final sampleVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

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
    final videoUrl = sampleVideoUrl[index % sampleVideoUrl.length];
    return Stack(
      children: [
        VideoPlayerList(
          videoUrl: videoUrl,
          onStateChange: (bool) {},
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
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdNotifier,
                      builder: (BuildContext ctx, Set<int> likedId, Widget? _) {
                        final index1 = index;
                        if (likedId.contains(index1)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdNotifier.value.remove(index1);
                              likedVideosIdNotifier.notifyListeners();
                            },
                            child: const VideoActions(
                              icon: Icons.favorite_outlined,
                              title: 'Liked',
                              iconColor: Colors.red,
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosIdNotifier.value.add(index1);
                            likedVideosIdNotifier.notifyListeners();
                          },
                          child: const VideoActions(
                              icon: Icons.favorite_border, title: 'Like'),
                        );
                      },
                    ),
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
  final Color iconColor;
  const VideoActions(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconColor = kwhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor,
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

class VideoPlayerList extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isplay) onStateChange;
  const VideoPlayerList({
    Key? key,
    required this.videoUrl,
    required this.onStateChange,
  }) : super(key: key);

  @override
  State<VideoPlayerList> createState() => _VideoPlayerListState();
}

class _VideoPlayerListState extends State<VideoPlayerList> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    videoPlayerController.initialize().then((value) {
      setState(() {});
      videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: videoPlayerController.value.isInitialized
          ? VideoPlayer(videoPlayerController)
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
