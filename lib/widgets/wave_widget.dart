import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:prectice0702/widgets/cliper_widget.dart';

class WavWidget extends StatefulWidget {
  final Size size;
  final double yOffset;
  final Color color;

  const WavWidget({
    super.key,
    required this.size,
    required this.yOffset,
    required this.color,
  });

  @override
  State<WavWidget> createState() => _WavWidgetState();
}

class _WavWidgetState extends State<WavWidget> with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..addListener(() {
            wavePoints.clear();

            final double waveSpeed = animationController!.value * 1080;
            final double fullSphere = animationController!.value * Math.pi * 2;
            final double normalizer = Math.cos(fullSphere);
            final double waveWidth = Math.pi / 270;
            final double waveHeight = 20;

            for (int i = 0; i <= widget.size.width.toInt(); ++i) {
              double calc = Math.sin((waveSpeed - i) * waveWidth);
              wavePoints.add(
                Offset(
                  i.toDouble(),
                  calc * waveHeight * normalizer + widget.yOffset,
                ),
              );
            }
          });
    animationController!.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(waveList: wavePoints),
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color: widget.color,
          ),
        );
      },
    );
  }
}
