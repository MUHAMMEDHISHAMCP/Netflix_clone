import 'package:flutter/cupertino.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 180,
        width: 120,
        decoration: BoxDecoration(
            image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                 imageUrl,
                )),
            borderRadius: BorderRadius.circular(7)),
      ),
    );
  }
}
