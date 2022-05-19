import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardInfo.dart';

class Body extends StatelessWidget {
  final CardInfo card;
  const Body({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            card.image,
            width: 200,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              card.description,
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }
}
