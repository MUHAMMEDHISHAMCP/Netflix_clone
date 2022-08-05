import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

import '../../../core/contant.dart';
import '../../home_page/home_screen.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: const [
              kheight20,
              Text('FEB',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.grey)),
              Text(
                '11',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              const VideoWidget(),
              kheight20,
              Row(
                children: [
                  const Text(
                    "KADUVA",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CostumButton(
                        icon: Icons.notifications_none_sharp,
                        title: 'Remind Me',
                        iconSize: 20,
                        textSize: 15,
                      ),
                      kwidth,
                      CostumButton(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 15,
                      ),
                      kwidth
                    ],
                  )
                ],
              ),
              const Text(
                'Released on Yesterday',
              ),
              kheight20,
              const Text('Kaduva',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              kheight,
              const Text(
                "The movie is an excellent take on the life and times of Kaduvakkunnel Kuruvachan. The script claims to represent Pala of the 90s and painstakingly avoids elements such as mobile phones. Therefore, it is absolutely natural and imperative for the director to stick to a 90s formula anything otherwise would have looked out of the way. Prithviraj shines as the protagonist. Emotions of shock, digust, anger, ",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
