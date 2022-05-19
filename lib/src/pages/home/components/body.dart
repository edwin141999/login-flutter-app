import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardInfo.dart';
import 'package:login_flutter/src/pages/details/details_screen.dart';
import 'package:login_flutter/src/pages/home/components/carousel.dart';
import 'package:login_flutter/src/pages/home/components/gridcard.dart';
import 'package:login_flutter/src/pages/home/components/slider_img.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SliderImg(),
          const Carousel(),
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: ColorSelect.txtBoHe,
            ),
            margin: const EdgeInsets.all(20),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  itemCount: cards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 25.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (ctx, index) => GridCard(
                    card: cards[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailsScreen(
                          card: cards[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
