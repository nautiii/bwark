import 'package:bwark/data/index_model.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final IndexModel model;
  const BottomBar({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.whatshot),
          label: 'Recommendation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Like',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download_for_offline_rounded),
          label: 'Download',
        ),
      ],
      currentIndex: model.index,
      onTap: (value) => model.index = value,
    );
  }
}
