import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xabarlar_uz/main_view_model.dart';
import 'package:xabarlar_uz/screens/detalis_page.dart';

class NewsItem extends StatelessWidget {
  String urlToImage;
  String author;
  String description;
  String publishedAt;
  String url;
  String content;

  NewsItem(
      {required this.urlToImage,
      required this.description,
      required this.author,
      required this.publishedAt,
      required this.url,
      required this.content,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                        url: url,
                        author: author,
                        content: content,
                        description: description,
                        publishedAt: publishedAt,
                        urlToImage: urlToImage),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(urlToImage ??
                      "https://www.moroylab.org/wp-content/uploads/2018/05/news-2444778_640.jpg"),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.amber,
                    width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                          backgroundColor: Color(0xff6E0A0910)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          author,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white,
                              backgroundColor: Color(0xff6E0A0910)),
                        ),
                        Text(
                          publishedAt,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white,
                              backgroundColor: Color(0xff6E0A0910)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}
