import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/home/components/body_home.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int pages = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda'),
        backgroundColor: ColorSelect.txtBoHe,
        toolbarHeight: 48,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.local_mall_outlined, size: 35),
                  const Icon(Icons.add_alert_outlined, size: 35),
                  SizedBox(
                    width: 35,
                    child: Image.asset(
                      'assets/images/icon_settings.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: ColorSelect.btnBackgroundBo1,
      body: const BodyHome(),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 70),
              painter: CurvePainter(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/icon_home.png',
                        color: pages == 0
                            ? ColorSelect.btnTextBo2
                            : ColorSelect.txtBoHe,
                      ),
                      onPressed: () {
                        setState(() {
                          pages = 0;
                        });
                      },
                      iconSize: 30,
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.20),
                  OutlinedButton(
                    onPressed: () {},
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/icon_order.png',
                        color: pages == 1
                            ? ColorSelect.btnTextBo2
                            : ColorSelect.txtBoHe,
                      ),
                      onPressed: () {
                        setState(() {
                          pages = 1;
                        });
                      },
                      iconSize: 30,
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.20),
                  OutlinedButton(
                    onPressed: () {},
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/icon_gps.png',
                        color: pages == 2
                            ? ColorSelect.btnTextBo2
                            : ColorSelect.txtBoHe,
                      ),
                      onPressed: () {
                        setState(() {
                          pages = 2;
                        });
                      },
                      iconSize: 30,
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ColorSelect.btnBackgroundBo2
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.1128000);
    path.quadraticBezierTo(
      size.width * 0.0902041,
      size.height * -0.0123000,
      size.width * 0.1633929,
      size.height * 0.0103000,
    );
    path.cubicTo(
        size.width * 0.2879847,
        size.height * -0.0231000,
        size.width * 0.2751786,
        size.height * 0.2655000,
        size.width * 0.5131633,
        size.height * 0.2771000);
    path.cubicTo(
        size.width * 0.6660204,
        size.height * 0.2665000,
        size.width * 0.6857398,
        size.height * 0.2169000,
        size.width * 0.7969133,
        size.height * 0.0897000);
    path.quadraticBezierTo(
      size.width * 0.8737500,
      size.height * -0.0645000,
      size.width * 0.9985969,
      size.height * 0.0723000,
    );
    path.lineTo(size.width * 0.9985969, size.height * 1.0058000);
    path.lineTo(size.width * -0.0014031, size.height * 1.0058000);
    path.lineTo(0, size.height * 0.1128000);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
