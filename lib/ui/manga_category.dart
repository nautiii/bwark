import 'package:flutter/material.dart';

class MangaCategory extends StatelessWidget {
  const MangaCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              "PLACEHOLDER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            color: Colors.deepOrange,
            width: MediaQuery.of(context).size.width,
            height: 100.0,
          )
        ],
      ),
    );
  }
}
