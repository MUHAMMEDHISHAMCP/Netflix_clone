import 'package:flutter/cupertino.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({Key? key, required this.tittle}) : super(key: key);
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Text(
      tittle,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }
}
