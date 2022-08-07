import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/contant.dart';

class CostumAppBar extends StatelessWidget {
  const CostumAppBar({Key? key, required this.tittle}) : super(key: key);
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kwidth,
          Text(tittle,
              style: GoogleFonts.montserrat().copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              )),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cast),
            color: Colors.white,
          ),
          kwidth,
          Container(
            color: Colors.blue,
            height: 30,
            width: 30,
          ),
          kwidth
        ],
      ),
    );
  }
}
