import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xabarlar_uz/main_view_model.dart';
import 'package:xabarlar_uz/widget/error_ui.dart';
import 'package:xabarlar_uz/widget/news_item.dart';

class MainBuilder extends StatelessWidget {
  const MainBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainViewModel>(context, listen: false);
    TextEditingController textEditingController = TextEditingController();
    return Consumer<MainViewModel>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: mainProvider.getNewsList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const ErrorUI();
            }
            if (snapshot.hasData) {
              if (mainProvider.newsList == 0) {
                return const Center(
                  child: Text("List error"),
                );
              }
            } else if (snapshot.hasError) {
              const Center(
                child: Text("Error"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: TextField(
                            cursorHeight: 30,
                            cursorColor: Colors.amber,
                            controller: textEditingController,
                            autofocus: false,
                            style: const TextStyle(
                                fontSize: 15,
                                height: 25 / 15,
                                color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Searching news',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            mainProvider.setUrl(textEditingController.text);
                            print(textEditingController.text);
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.amber,
                          ))
                    ],
                  ),
                  Expanded(
                    child: SizedBox(

                      child: ListView.builder(
                        itemCount: mainProvider.newsList.length ?? 0,
                        itemBuilder: (context, index) {
                          return NewsItem(
                            content: mainProvider.newsList[index].content??"No data",
                              urlToImage:
                                  mainProvider.newsList[index].urlToImage ?? "",
                              description:
                                  mainProvider.newsList[index].title ?? "No data",
                              author: mainProvider.newsList[index].author ??
                                  "No data",
                              publishedAt:
                                  mainProvider.newsList[index].publishedAt ??
                                      "No data",
                          url: mainProvider.newsList[index].url??"https://www.google.com/",);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
