import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Map<String, String>> onBoardingDatas = [
    {"text": 'Hola onboarding 1', 'image': 'assets/images/flutterLogo.jpg'},
    {"text": 'Hola onboarding 2', 'image': 'assets/images/flutterLogo.jpg'},
    {"text": 'Hola onboarding 3', 'image': 'assets/images/flutterLogo.jpg'},
    {"text": 'Hola onboarding 4', 'image': 'assets/images/flutterLogo.jpg'},
    {"text": 'Hola onboarding 5', 'image': 'assets/images/flutterLogo.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: onBoardingDatas.length,
                  itemBuilder: (context, index) => ContentBoarding(
                    text: onBoardingDatas[index]["text"]!,
                    image: onBoardingDatas[index]["image"]!,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(),
        Text(
          text,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 21,
          ),
        ),
        Image.asset(
          'assets/images/flutterLogo.jpg',
          width: 200,
          height: 200,
        ),
      ],
    );
  }
}
