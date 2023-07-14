import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:xabarlar_uz/moduls/news.dart';
import 'package:xabarlar_uz/moduls/news_service.dart';

class MainViewModel extends ChangeNotifier {
  List<String> newsCategory = [
    "Business",
    "Politics",
    "Society",
    "Show Business",
    "The latest",
    "Religious",
    "Fashion",
    "Science",
    "Technology",
    "Music",
    "Cyber attack",
    "Art and culture",
    "Cinema",
    "Sports",
    "Education",
    "Car",
    "Makeup",
    "Nature",
    "Animal",
    "Archaeologist",
    "Medicine",
    "Diseases",
    "Exchange rate",
  ];

  late String word;

  words() {
    var rng = Random();
    word = newsCategory[rng.nextInt(newsCategory.length)];
    print(word);
  }

  setUrl(String query) {
    word = query;
    refresh();
  }

  List<String> keys = [
    "f32ed293692d45b3814fbb4db1e61bd0",
    "df140632831c47dc9509f3ada2fd0d9b",
    "113664d59f724f4a9ad8813e6979aca6",
    "ba133a116f164f688db5bf5ec2fd79e9",
    "de204265aa8e4d71b9ac4db7956ef8d6",
  ];

  String getUrl(String key) {
    words();
    String url = "https://newsapi.org/v2/everything?q=$word&"
        "from=2023-06-30&"
        "sortBy=publishedAt&"
        "apiKey=$key";
    print(url);
    return url;
  }

  List<News> newsList = [];

  Future<List<News>> getNewsList() async {
    newsList = await NewsService.getNewsList(getUrl(keys[0])) ??
        await NewsService.getNewsList(getUrl(keys[1])) ??
        await NewsService.getNewsList(getUrl(keys[2])) ??
        await NewsService.getNewsList(getUrl(keys[3])) ??
        await NewsService.getNewsList(getUrl(keys[4]));
    return newsList;
  }

  refresh() {
    notifyListeners();
  }
}
