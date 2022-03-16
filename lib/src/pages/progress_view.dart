import 'package:flutter/material.dart';
import 'package:login_flutter/src/painters/progress_painter.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({Key? key}) : super(key: key);

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: ColorSelect.paginatorNext,
          width: 200,
          height: 200,
          child: AnimatedContainer(
            duration: const Duration(seconds: 10),
            child: const CustomPaint(
              painter: ProgressPainter(10),
            ),
          ),

          //ProgressPainter
        ),
      ),
    );
  }
}
