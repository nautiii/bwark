import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class MyAnimeListAPI extends MyAnimeListAuth {
  final _host = 'api.myanimelist.net';
  final _version = 'v2';
  final _accessToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImU1OTA2NjczYjgzZTEzNTUwZjU4NTlhMTg2NjBmMTE4NGE2ODU0YzY4ZmM0MGVjNzgzZDAxM2E3NjZjZDU3NWQwNDI1ODhkMzY2ODlmMTA1In0.eyJhdWQiOiIwM2JmMjFlZGM4MzYzYzEyYjU2ODU5MDUyOGRjNGMxZSIsImp0aSI6ImU1OTA2NjczYjgzZTEzNTUwZjU4NTlhMTg2NjBmMTE4NGE2ODU0YzY4ZmM0MGVjNzgzZDAxM2E3NjZjZDU3NWQwNDI1ODhkMzY2ODlmMTA1IiwiaWF0IjoxNjYzNTIwMTk1LCJuYmYiOjE2NjM1MjAxOTUsImV4cCI6MTY2NjExMjE5NSwic3ViIjoiMTUxNzA0MDciLCJzY29wZXMiOltdfQ.DGI6P2ohdbkA_bvqS_SU_A2Lg11cqM-KWGisJkZE5ges7KmT_RMpy26dA1VgP6vZS_8tdjOGPNCtASN5VEWm_5w9k95FATnafWuax3CC0cQ2K9-9zz330p0I-Hv6-FlbmgYO6eM0cYi2S9m4T7OFUzjrIPKCiM-RWupAmb70ZQboWAAoYJYrVLZN7n6YynPfGU60mBaXcMkkJpCl15voaevDT0XFtihekCQfemE5Ozp_LA7Q1KoYlPXCe_2PRPWJ63qhtqvQvU78QEpmRB9UnrGs6bnad_9Q8seDxOlqVAh2p4SO7FUR_bGzXvjbx4kpGlOqS-chRk9ZcuJIlhtI0A';

  Map<String, String> get _headers => {
        'content-type': 'application/vnd.api+json',
        'Accept': 'application/json',
      };

  Future<Map> _request(String path, Map<String, Object> params) async {
    final uri = Uri.https(_host, '$_version/$path', params);
    final results = await http.get(uri, headers: _headers);

    return json.decode(results.body);
  }

  Future getMangaByName(String name) async {
    final request = await _request('manga', <String, String>{'q': name});

    return request;
  }

  // Future<List<Article>?> fetchArticles(String? query) async {
  //   Map<String, Object> params = {
  //     'filter[content_types][]': 'article',
  //     'page[size]': '25',
  //   };
  //
  //   if (query != null && query.isNotEmpty) {
  //     params['filter[q]'] = query;
  //   }
  //
  //   final results = await request(path: 'contents', params: params);
  //   return results['data'].map<Article>(Article.fromJson).toList(growable: false);
  // }
  //
  // Future<Article?> getDetailArticle(String id) async {
  //   final results = await request(path: 'contents/$id', params: {});
  //   final data = results['data'];
  //   return Article.fromJson(data);
  // }
}

class MyAnimeListAuth {
  Future authorize() async {
    const Map<String, Object> params = {
      'response_type': 'code',
      'client_id': '03bf21edc8363c12b568590528dc4c1e',
      'state': 'ok',
      'code_challenge': 'C5kAY9f5fdzoVu_iwLCN0JZpO0LfC76PVE-qWClk8-A',
    };
    final uri = Uri.https('myanimelist.net', 'v1/oauth2/authorize', params);
    await http.get(uri);
  }

  Future<dynamic> getToken() async {
    const code =
        'def50200e7269b5869f2902dc93faa7d37b414e8a5fcc4c368fccb7d0ce9290f74350ebeb97e6a471b915e6d4483974656200ae1f28c42bb8926c327057fe684983108ed98347f4b76665151c0f8489affe5500202cceea9fa5679e1d60d9b53d4ea6a2600ba9829ba58a03c04a9f5c1b441be486e135aa2dc2db79ebb09be3fa087fc582f7a26aac4182d62a1559a606ebc2936c5a0b6bc055eb0291e6a3cfc1f66198cbc73e57ea4215b3b951ee148a567afa21606452ce80d4f13dec99d28bd79c8e2f586f8327dfd495caf184c2b65e7d70c8526c3015225889f00de830526c83e09b982a1c11cb77c9a7729750ac3bef22cacdd5612f53cf82e1fd17c1ab1383d979cd886aa01460f793f6f9938e55a4a4810252e9ec8837bbb7ded71f3366b781fce90d98a460e15b91d48f5946fec2db50073823ae397f6383d37998b1c70ff6d28a5a202c7481b3f06fd64336acc32fc192cb8e43a671da6ffa4db1f0d1363908be21a26ca7aa9e5d22d25081f3a34e41cc80454e0f48131f9d9d610c518e1c3c5eef81d3e3ebae9af195c9ac24765fa4b';
    final uri = Uri.https('myanimelist.net', 'v1/oauth2/token');
    final results = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'client_id': '03bf21edc8363c12b568590528dc4c1e',
        'grant_type': 'authorization_code',
        'code': code,
        'code_verifier': 'C5kAY9f5fdzoVu_iwLCN0JZpO0LfC76PVE-qWClk8-A',
      },
    );

    return jsonDecode(results.body);
  }

  Future<dynamic> refreshToken() async {
    const String refreshToken =
        'def502005cd8bfca7ab804d5ec21dc72c7355845ba56290af8c04d5676219d07084b10c5dcfc6f8af3e447918f1a5aaea486f433cef6f8f9c672091ee97e4aedbfa30bb1e8b8c3b3de5b943b03c87c91e09';
    final uri = Uri.https('myanimelist.net', 'v1/oauth2/token');
    final results = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
      },
    );

    return jsonDecode(results.body);
  }
}
