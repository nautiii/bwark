import 'package:flutter/material.dart';

class MangaMenu extends StatelessWidget {
  const MangaMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
        color: Colors.black,
        child: Center(
          child: Text(
            'Manga Menu',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
