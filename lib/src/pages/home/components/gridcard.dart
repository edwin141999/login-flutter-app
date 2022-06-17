import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardInfo.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class GridCard extends StatelessWidget {
  final CardInfo card;
  const GridCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: ColorSelect.btnTextBo3,
          width: 2,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              card.image,
              width: 160,
              height: 120,
            ),
            Text(
              card.title,
              style: const TextStyle(
                color: ColorSelect.btnBackgroundBo2,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
