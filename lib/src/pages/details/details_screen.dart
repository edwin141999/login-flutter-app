import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardInfo.dart';
import 'package:login_flutter/src/pages/details/components/body.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class DetailsScreen extends StatelessWidget {
  final CardInfo card;

  const DetailsScreen({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        card: card,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(card.title),
      backgroundColor: ColorSelect.txtBoHe,
      leading: IconButton(
        onPressed: () => {Navigator.pop(context)},
        color: ColorSelect.paginatorNext,
        icon: const Icon(Icons.arrow_back),
      ),
      toolbarHeight: 48,
      actions: [
        Container(
          width: 100,
          child: Image.asset(
            'assets/images/splash.png',
            color: Colors.white,
          ),
          color: Colors.transparent,
        )
      ],
    );
  }
}
