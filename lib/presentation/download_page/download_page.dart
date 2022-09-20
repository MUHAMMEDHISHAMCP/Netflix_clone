import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/download/downloads_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/const_uri.dart';
import 'package:netflix_clone/core/contant.dart';
import 'package:netflix_clone/presentation/widgets/costune_appbar.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({Key? key}) : super(key: key);
  final _widgetList = [
    const _SmartDownloads(),
    const Section2(),
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
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

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
          "We will download a personalised selection of  movies and shows  for you so there's \n always something to watch on your \n device",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        kheight,
        BlocBuilder<DownloadsBloc, DownloadState>(
          builder: (context, state) {
            return Container(
              width: size.width,
              height: size.width * 0.8,
              color: Colors.transparent,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.downloads.isEmpty
                      ? const Center(child: CircularProgressIndicator(strokeWidth: 2,))
                      : Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            CircleAvatar(
                                radius: size.width * 0.35,
                                backgroundColor: Colors.grey.withOpacity(0.5)),
                            DownloadImageWidget(
                              margin:
                                  const EdgeInsets.only(left: 130, bottom: 50),
                              angle: 20,
                              imageList: '$imageAppendUrl${state.downloads[0].posterPath}',
                              size: Size(
                                size.width * 0.36,
                                size.width * 0.52,
                              ),
                            ),
                            DownloadImageWidget(
                              margin:
                                  const EdgeInsets.only(right: 130, bottom: 50),
                              angle: -20,
                              imageList: '$imageAppendUrl${state.downloads[1].posterPath}',
                              size: Size(
                                size.width * 0.38,
                                size.width * 0.52,
                              ),
                            ),
                            DownloadImageWidget(
                              margin: const EdgeInsets.only(bottom: 15),
                              imageList: '$imageAppendUrl${state.downloads[2].posterPath}',
                              size: Size(
                                size.width * 0.36,
                                size.width * 0.58,
                              ),
                            )
                          ],
                        ),
            );
          },
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
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            )),
      ),
    );
  }
}
