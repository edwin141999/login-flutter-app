import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/home/home_screen.dart';
import 'package:login_flutter/src/splash/splash_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // home: SplashView(),
      home: UserPage(),
    );
  }
}
