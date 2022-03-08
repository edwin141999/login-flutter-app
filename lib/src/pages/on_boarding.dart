import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_flutter/src/pages/content_boarding.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pages = 0;
  List<Map<String, String>> onBoardingDatas = [
    {
      "text": 'ESPARCIMIENTO',
      "text1": 'lorem ipsum',
      'image': 'assets/images/flutterLogo.jpg'
    },
    {
      "text": 'ADOPCION',
      "text1": 'Nulla faucibus tullus',
      'image': 'assets/images/flutterLogo.jpg'
    },
    {
      "text": 'HOSPITALIDAD',
      "text1": 'Nulla faucibus tullus',
      'image': 'assets/images/flutterLogo.jpg'
    },
    {
      "text": 'Hola onboarding 4',
      "text1": '789',
      'image': 'assets/images/flutterLogo.jpg'
    },
    {
      "text": 'Hola onboarding 5',
      "text1": '000',
      'image': 'assets/images/flutterLogo.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        pages = value;
                      });
                    },
                    itemCount: onBoardingDatas.length,
                    itemBuilder: (context, index) => ContentBoarding(
                      text: onBoardingDatas[index]["text"]!,
                      text1: onBoardingDatas[index]["text1"]!,
                      image: onBoardingDatas[index]["image"]!,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingDatas.length,
                          (index) => newMethod(index: index),
                        ),
                      ),
                      //AQUI VA EL BOTON, boton con borde, ? verde : blanco el texto es continuar
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer newMethod({required int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      height: 4,
      width: pages == index ? 20 : 12,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color:
            pages == index ? ColorSelect.paginatorNext : ColorSelect.paginator,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
