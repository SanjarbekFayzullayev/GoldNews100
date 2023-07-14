import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xabarlar_uz/main_view_model.dart';

class ErrorUI extends StatelessWidget {
  const ErrorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainViewModel>(context, listen: false);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const CircularProgressIndicator(color: Colors.amber,),
        const Text(
            "You have reached your daily credit limit or there is an internet error!",
            style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        OutlinedButton(style: const ButtonStyle(side: MaterialStatePropertyAll(BorderSide(width: 4,color: Colors.brown))),
            onPressed: () {

              mainProvider.refresh();
            },
            child: const Text("Refresh"))
      ],
    );
  }
}
