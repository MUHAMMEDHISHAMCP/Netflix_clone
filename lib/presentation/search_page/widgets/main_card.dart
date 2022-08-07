import 'package:flutter/cupertino.dart';

class MainShowCard extends StatelessWidget {
  final String imageUrl;
  const MainShowCard({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:  DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
               imageUrl,
              )),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
