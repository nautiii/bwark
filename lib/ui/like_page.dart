import 'package:flutter/material.dart';

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(child: Text('Like', style: TextStyle(color: Colors.white))),
    );
  }
}
