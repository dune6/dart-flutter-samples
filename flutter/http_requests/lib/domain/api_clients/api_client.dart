import 'dart:convert';
import 'dart:io';

import 'package:http_requests/domain/entity/post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final request = await client.getUrl(url);
    // ответ
    final response = await request.close();

    // присылаются пакетами по частям
    // присланные данные с сервера конвертируем в string
    // когда поток закрывается, он собирает всё в массив
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();

    // докодируем в json
    final json = jsonDecode(jsonString) as List<dynamic>;

    // преобразуем в Post objects
    final posts =
        json.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();

    return posts;
  }

  Future<Post> createPosts(
      {required String title, required String body}) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final parameters = <String, dynamic>{
      'title': title,
      'body': body,
      'userId': 106
    };
    final request = await client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString) as Map<String, dynamic>;
    return Post.fromJson(json);
  }
}
