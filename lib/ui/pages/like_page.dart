import 'package:bwark/ui/shared/manga_category.dart';
import 'package:flutter/material.dart';

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        top: MediaQuery.of(context).size.height * 0.15,
      ),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Continue',
                    style: TextStyle(
                        color: Colors.deepOrange.shade50,
                        fontSize: 30,
                        fontWeight: FontWeight.w600)),
              ),
              const MangaCategory(displayTitle: false),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Favorites',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 15,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    color: Colors.deepOrange,
                    height: 100.0,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// const SizedBox(height: 30.0),
// SizedBox(
// height: 382.6,
// child: ListView.builder(
// shrinkWrap: true,
// itemCount: 5,
// itemBuilder: (BuildContext context, int index) {
// return Text('placeholder', style: TextStyle(color: Colors.white70),);
// },
// ),
// ),
// ],
// ),
// ),
