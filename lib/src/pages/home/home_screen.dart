import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/home/components/body.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: ColorSelect.txtBoHe,
        automaticallyImplyLeading: false,
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
      ),
      backgroundColor: ColorSelect.btnBackgroundBo1,
      body: const Body(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: 1,
        iconSize: 30,
        backgroundColor: ColorSelect.txtBoHe,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: ''),
        ],
      ),
    );
  }
}
