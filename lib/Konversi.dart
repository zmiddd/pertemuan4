import 'package:flutter/material.dart';

class Konversi extends StatelessWidget {
  const Konversi({
    Key? key,
    required this.convertHandler,
  }) : super(key: key);

  final Function convertHandler;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        convertHandler();
      },
      child: const Text(
        "Konversikan",
        style: TextStyle(fontSize: 20),
      ),
      color: Colors.red,
      textColor: Colors.orange,
      minWidth: double.maxFinite,
      height: 50,
    );
  }
}
