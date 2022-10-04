import 'package:bwark/data/manga_model.dart';
import 'package:bwark/ui/shared/manga_menu.dart';
import 'package:bwark/ui/shared/modal/modal_button.dart';
import 'package:flutter/material.dart';

Future<void> showMangaModal(BuildContext context, MangaModel manga) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: const Color.fromRGBO(16, 16, 16, 1.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      double modalHeight = MediaQuery.of(context).size.height * 0.4;

      return SizedBox(
        height: modalHeight,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MangaMenu(manga: manga))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(manga.attributes!.image!,
                            fit: BoxFit.cover, height: modalHeight * 0.5),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        manga.title,
                                        style: TextStyle(
                                            color: Colors.deepOrange.shade50,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              manga.attributes!.startDate!
                                                  .split('-')[0],
                                              style: TextStyle(
                                                  color: Colors.deepOrange.shade50
                                                      .withOpacity(0.5),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox.fromSize(
                                                size: const Size(32.0, 0.0)),
                                            Text(
                                              manga.attributes!.popularity!
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.deepOrange.shade50
                                                      .withOpacity(0.5),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.black, // Splash color
                                      onTap: () => Navigator.of(context).pop(),
                                      child: const SizedBox(
                                          width: 32.0,
                                          height: 32.0,
                                          child: Icon(Icons.close, size: 32.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              manga.attributes!.synopsis!,
                              style: TextStyle(
                                color: Colors.deepOrange.shade50,
                                fontSize: 16,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              height: 72.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ModalButton(
                      icon: Icons.menu_book, title: 'Read', action: () {}),
                  ModalButton(
                      icon: Icons.favorite_border,
                      title: 'Like',
                      action: () {}),
                  ModalButton(
                      icon: Icons.download_for_offline_outlined,
                      title: 'Download',
                      action: () {}),
                  ModalButton(
                      icon: Icons.share_outlined,
                      title: 'Share',
                      action: () {}),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      color: Colors.deepOrange.shade50.withOpacity(0.5)),
                )),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MangaMenu(manga: manga))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.info_outline),
                        ),
                        Text(
                          'Discover this manga',
                          style: TextStyle(
                              color: Colors.deepOrange.shade50, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
