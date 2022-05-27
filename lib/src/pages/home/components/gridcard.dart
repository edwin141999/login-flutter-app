import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardInfo.dart';

class GridCard extends StatelessWidget {
  final CardInfo card;
  final Function() press;
  const GridCard({
    Key? key,
    required this.card,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Image.asset(
              card.image,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
