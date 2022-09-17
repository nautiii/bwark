import 'package:bwark/ui/shared/manga_modal.dart';
import 'package:flutter/material.dart';

class MangaCategory extends StatelessWidget {
  final bool displayTitle;

  const MangaCategory({Key? key, this.displayTitle = true}) : super(key: key);

  Widget manga(BuildContext context) => InkWell(
        onTap: () => showMangaModal(context),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(
            'https://images-na.ssl-images-amazon.com/images/I/81ZwggSh1zL.jpg',
            fit: BoxFit.cover,
            width: 110.0,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (displayTitle == true)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
              child: Text(
                "Placeholder",
                style: TextStyle(
                    color: Colors.deepOrange.shade50,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          SizedBox(
            height: 150.0,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: manga(context),
                    )),
          ),
        ],
      ),
    );
  }
}
