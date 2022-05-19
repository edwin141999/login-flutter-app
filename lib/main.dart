import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_flutter/src/pages/home_header.dart';
import 'package:login_flutter/src/pages/progress_view.dart';
import 'package:login_flutter/src/splash/splash_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // initialRoute: 'InitialHeader',
      // routes: {
      //   'InitialHeader': (BuildContext context) => const HomeHeader()
      // },
      home: SplashView(),
      // home: ProgressView(),
    );
  }
}
