import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  final String? imageUrl;
  const VideoWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage('$imageUrl'),
            fit: BoxFit.cover,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (BuildContext a, Object _, StackTrace? trace) {
              return const Center(child: Icon(Icons.wifi));
            },
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
