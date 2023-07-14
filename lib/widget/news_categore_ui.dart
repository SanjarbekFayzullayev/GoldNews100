import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xabarlar_uz/main_view_model.dart';

class NewsCategoryUI extends StatefulWidget {
  final int index;

  const NewsCategoryUI(this.index, {Key? key}) : super(key: key);

  @override
  State<NewsCategoryUI> createState() => _NewsCategoryUIState();
}

class _NewsCategoryUIState extends State<NewsCategoryUI> {
  bool isBG = true;

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainViewModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: OutlinedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(isBG ? Colors.amber : Colors.white),
            elevation: const MaterialStatePropertyAll(10),
            shadowColor: const MaterialStatePropertyAll(Colors.amber),
            side: const MaterialStatePropertyAll(BorderSide(
                style: BorderStyle.solid, color: Colors.amber, width: 4))),
        onPressed: () {
          setState(() {
            isBG = !isBG;
          });
          mainProvider.setUrl(mainProvider.newsCategory[widget.index]);
          print(mainProvider.word);
          mainProvider.refresh();
        },
        child: Text(
          mainProvider.newsCategory[widget.index],
          style: const TextStyle(color: Colors.brown),
        ),
      ),
    );
  }
}
