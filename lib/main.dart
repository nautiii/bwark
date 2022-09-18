import 'package:bwark/data/api_myanimelist.dart';
import 'package:bwark/data/index_model.dart';
import 'package:bwark/ui/pages/download_page.dart';
import 'package:bwark/ui/pages/home_page.dart';
import 'package:bwark/ui/pages/like_page.dart';
import 'package:bwark/ui/pages/recommendation_page.dart';
import 'package:bwark/ui/header_bar.dart';
import 'package:flutter/material.dart';

import 'package:bwark/data/theme.dart';
import 'package:bwark/ui/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> widgetOptions = <Widget>[
      HomePage(),
      RecommendationPage(),
      LikePage(),
      DownloadPage(),
    ];

    return MaterialApp(
      theme: bwarkTheme,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<IndexModel>(
        create: (_) => IndexModel(),
        child: Consumer<IndexModel>(
          builder: (_, model, child) => Scaffold(
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                widgetOptions.elementAt(model.index),
                child!,
              ],
            ),
            bottomNavigationBar: BottomBar(model: model),
          ),
          child: const HeaderBar(),
        ),
      ),
    );
  }
}
