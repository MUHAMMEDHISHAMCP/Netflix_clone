import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

import '../../../core/contant.dart';
import '../../home_page/home_screen.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
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
            children:  [
              kheight20,
              Text(month,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 17, color: Colors.grey)),
              Text(
                day,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          // height: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
               VideoWidget(imageUrl: posterPath,),
              kheight20,
              Row(
                children: [
                   Expanded(
                     child: Text(
                      movieName,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -2),
                                     ),
                   ),
                
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
               Text(movieName,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              kheight,
               Text(
              description, maxLines: 7,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
