import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xabarlar_uz/main_view_model.dart';

class NewsChip extends StatefulWidget {
  int index;


  NewsChip(this.index, {Key? key}) : super(key: key);

  @override
  State<NewsChip> createState() => _NewsChipState();
}

class _NewsChipState extends State<NewsChip> {
  bool bg=true;
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainViewModel>(context, listen: false);
    return Consumer<MainViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color:bg? Colors.amber:Colors.black),
            child: InkWell(
              onTap: () {
                bg=!bg;
                mainProvider.setUrl(mainProvider.newsCategory[widget.index]);
                print(mainProvider.word);
                mainProvider;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(mainProvider.newsCategory[widget.index],style: TextStyle(color: bg? Colors.black:Colors.amber)),
              ),
            ));
      },

    );
  }
}
