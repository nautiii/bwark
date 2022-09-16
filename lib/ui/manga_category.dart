import 'package:flutter/material.dart';

class MangaCategory extends StatelessWidget {
  const MangaCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
            child: Text(
              "Placeholder",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),

          SizedBox(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.deepOrange, margin: const EdgeInsets.symmetric(horizontal: 5.0), width: 80.0),
                Container(color: Colors.deepOrange, margin: const EdgeInsets.symmetric(horizontal: 5.0), width: 80.0),
                Container(color: Colors.deepOrange, margin: const EdgeInsets.symmetric(horizontal: 5.0), width: 80.0),
                Container(color: Colors.deepOrange, margin: const EdgeInsets.symmetric(horizontal: 5.0), width: 80.0),
                Container(color: Colors.deepOrange, margin: const EdgeInsets.symmetric(horizontal: 5.0), width: 80.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
