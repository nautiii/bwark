import 'package:bwark/ui/manga_category.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imgHeight = MediaQuery.of(context).size.height * 0.5;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(
            "lib/assets/home.png",
            width: MediaQuery.of(context).size.width,
            height: imgHeight,
            fit: BoxFit.fitHeight,
            filterQuality: FilterQuality.medium,
          ),
          Container(
            margin: EdgeInsets.only(top: imgHeight * 0.76),
            padding: const EdgeInsets.only(top: 100.0),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.1],
                    colors: [Colors.transparent, Colors.black])),
            child: Column(
              children: const [
                MangaCategory(),
                MangaCategory(),
                MangaCategory(),
                MangaCategory(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
