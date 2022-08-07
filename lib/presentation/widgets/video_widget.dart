import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage(
                "https://www.nowrunning.com/content/movie/2020/kaduv-24597/Stills/kaduva5_2022620.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.7),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.volume_off)),
          ),
        ),
      ],
    );
  }
}
