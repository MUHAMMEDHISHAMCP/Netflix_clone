import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/contant.dart';
import 'package:netflix_clone/presentation/widgets/costune_appbar.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({Key? key}) : super(key: key);
  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CostumAppBar(
            tittle: 'Download',
          )),
      body: SafeArea(
          child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: ((context, index) => _widgetList[index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: _widgetList.length)),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  final imageList = [
    "https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg",
    "https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg",
    "https://images.complex.com/complex/image/upload/c_fill,dpr_auto,f_auto,fl_lossy,g_face,q_auto,w_1280/wjnhpz3osrai5aningjl.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Indroducing downloads for you',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kheight,
        const Text(
          "We will download a personalised selection of \n movies and shows  for you so there's \n always something to watch on your \n device",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        kheight,
        Container(
          width: size.width,
          height: size.width * 0.8,
          color: Colors.transparent,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                  radius: size.width * 0.35,
                  backgroundColor: Colors.grey.withOpacity(0.5)),
              DownloadImageWidget(
                margin: const EdgeInsets.only(left: 130, bottom: 50),
                angle: 20,
                imageList: imageList[0],
                size: Size(
                  size.width * 0.36,
                  size.width * 0.52,
                ),
              ),
              DownloadImageWidget(
                margin: const EdgeInsets.only(right: 130, bottom: 50),
                angle: -20,
                imageList: imageList[1],
                size: Size(
                  size.width * 0.38,
                  size.width * 0.52,
                ),
              ),
              DownloadImageWidget(
                margin: const EdgeInsets.only(bottom: 15),
                imageList: imageList[2],
                size: Size(
                  size.width * 0.36,
                  size.width * 0.58,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {},
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Setup',
                  style: TextStyle(
                      color: kwhite, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )),
        ),
        kheight,
        MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            color: kwhite,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                    color: backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        kwidth,
        Text('Smart downloading'),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {Key? key,
      required this.imageList,
      required this.size,
      this.angle = 0,
      required this.margin})
      : super(key: key);
  final Size size;
  final double angle;
  final EdgeInsets margin;
  final String imageList;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        // width: size.width * 0.36,
        // height: size.width *0.56,
        width: size.width,
        height: size.height,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: backgroundColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            )),
      ),
    );
  }
}
