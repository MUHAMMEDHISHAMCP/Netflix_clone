import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/fastlaugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/presentation/fastlaugh_page/widgets/video_list.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const initialize());
    });
    return Scaffold(
      body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(child: Text('Not get data'));
          } else if (state.videoList.isEmpty) {
            return const Center(child: Text('Videos empty'));
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videoList.length, (index) {
                return VideoListInherit(
                    movieData: state.videoList[index],
                    widget:
                        VideoList(key: Key(index.toString()), index: index));
              }),
            );
          }
        },
      )),
    );
  }
}
