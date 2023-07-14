import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xabarlar_uz/main_view_model.dart';
import 'package:xabarlar_uz/widget/news_categore_ui.dart';

class HeadBuilder extends StatelessWidget {
  const HeadBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainViewModel>(context, listen: false);
    return Consumer<MainViewModel>(builder: (context, value, child) {
    return  SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mainProvider.newsCategory.length,
        itemBuilder: (context, index) {
          return NewsCategoryUI(index);
        },
      ),
    );
    },) ;
  }
}
