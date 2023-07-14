import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xabarlar_uz/main_view_model.dart';
import 'package:xabarlar_uz/widget/error_ui.dart';
import 'package:xabarlar_uz/widget/header_bulider.dart';
import 'package:xabarlar_uz/widget/main_bulider.dart';
import 'package:xabarlar_uz/widget/news_categore_ui.dart';

import 'package:xabarlar_uz/widget/news_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isBG=true;
  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, value, child) {
        return const Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton:HeadBuilder(),
          backgroundColor: Colors.grey,
          body: MainBuilder(),
        );
      },
    );
  }

}

