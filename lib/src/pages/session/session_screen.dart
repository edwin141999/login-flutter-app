import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/session/components/body_session.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorSelect.btnBackgroundBo1,
      body: BodySession(),
    );
  }
}
