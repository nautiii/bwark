import 'package:bwark/resources/manga_source.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

class MangaScanTradSource implements MangaSource {
  @override
  Future<int> getTotalChapters(String name) async {
    final url = Uri.parse('https://mangahub.io/manga/${name.toLowerCase()}');

    final response = await http.get(url, headers: {
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0",
      "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
      "Accept-Language": "en-US,en;q=0.5",
      "Accept-Encoding": "gzip, deflate",
      "Connection": "keep-alive",
      "Upgrade-Insecure-Requests": "1",
      "Sec-Fetch-Dest": "document",
      "Sec-Fetch-Mode": "navigate",
      "Sec-Fetch-Site": "none",
      "Sec-Fetch-User": "?1",
      "Cache-Control": "max-age=0",
    });

    try {
      if (response.statusCode == 200) {
        Document document = parse(response.body);
        var a = document.getElementsByClassName('_3SlhO');

        Element el = document.getElementsByClassName('wp-manga-chapter').first;
        return int.parse(el.text.split(' ')[1]);
      }
      throw response.reasonPhrase ?? 'http error';
    } catch (exception) {
      return -1;
    }
  }
}
