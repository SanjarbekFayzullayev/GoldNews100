import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:xabarlar_uz/moduls/news.dart';

class NewsService {


  static getNewsList(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<News> newsList;
      var finalResult = json.decode(response.body);
      newsList = (finalResult["articles"] as List)
          .map((e) => News.fromJson(e))
          .toList();
      return newsList;
    }
  }
}
