import 'package:flutter/material.dart';

Future<void> showMangaModal(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: const Color.fromRGBO(10, 10, 10, 1.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.35,
      );
    },
  );
}
