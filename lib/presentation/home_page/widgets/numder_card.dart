import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index,required this.imageUrl}) : super(key: key);
  final int index;
  final List<String> imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 180,
              width: 35,
            ),
            Container(
              height: 180,
              width: 120,
              decoration: BoxDecoration(
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imageUrl[index],
                      )),
                  borderRadius: BorderRadius.circular(7)),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 17,
          child: BorderedText(
              strokeWidth: 6.0,
              strokeColor: Colors.white,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 110,
                    fontWeight: FontWeight.w900),
              )),
        ),
      ],
    );
  }
}
