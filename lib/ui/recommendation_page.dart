import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(child: Text('Recommendation', style: TextStyle(color: Colors.white))),
    );
  }
}
