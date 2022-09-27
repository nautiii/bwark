import 'package:bwark/data/manga_model.dart';
import 'package:flutter/material.dart';

Future<void> showMangaModal(BuildContext context, MangaModel manga) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: const Color.fromRGBO(16, 16, 16, 1.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.36,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(manga.attributes!.image!,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      children: [
                        Text(
                          manga.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          manga.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          manga.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.deepOrange,
              height: 72.0,
            ),
            Expanded(
                child: Container(
              color: Colors.orange,
            )),
          ],
        ),
      );
    },
  );
}
