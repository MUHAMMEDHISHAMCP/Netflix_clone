import 'package:flutter/cupertino.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 180,
        width: 120,
        decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_90,w_1400/fl_lossy,pg_1/gdv2pu6io6ekpg5r8mta/back-to-the-future",
                )),
            borderRadius: BorderRadius.circular(7)),
      ),
    );
  }
}
