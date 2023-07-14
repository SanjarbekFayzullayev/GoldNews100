import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  String urlToImage;
  String author;
  String description;
  String publishedAt;
  String url;
  String content;

  DetailsPage(
      {required this.urlToImage,
      required this.description,
      required this.author,
      required this.publishedAt,
      required this.url,
      required this.content,
      Key? key})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.urlToImage), fit: BoxFit.cover)),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              actions: [
                Card(
                    color: const Color(0xffADFFFFFF),
                    child: IconButton(
                        onPressed: () {
                          _launchUrl(widget.url);
                        },
                        icon: const Icon(CupertinoIcons.globe)))
              ],
              leading: Card(
                  color: const Color(0xffADFFFFFF),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back))),
              expandedHeight: size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(
                  widget.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
              floating: true,
              snap: true,
              pinned: true,
            ),
          ],
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.limeAccent),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(widget.description,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(widget.author)),
                                Expanded(child: Text(widget.publishedAt)),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.content,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              _launchUrl(widget.url);
                            },
                            child: const Text(
                              "More",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  textBaseline: TextBaseline.alphabetic),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchUrl(url) async {
    await launch(url);
  }
}
