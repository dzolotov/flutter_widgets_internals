import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

import 'render_objects/3d/widgets/flutter3d.dart';

class SphereSample extends StatefulWidget {
  const SphereSample({Key? key}) : super(key: key);

  @override
  State<SphereSample> createState() => _SphereSampleState();
}

class _SphereSampleState extends State<SphereSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _controller
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return SpaceToWidgetAdapter(
      child: AnimatedBuilder(
        builder: (context, _) => HorizontalSpaceLayout(
          scale: 20,
          children: [
            SphereWidget(
              volume: Vector3(10, 10, 10),
              color: Colors.green,
              scale: Vector3.all(_controller.value * 0.5 + 1),
              rotation: Quaternion.axisAngle(
                  Vector3(0, 0, 1), _controller.value * 2 * pi),
            ),
            SphereWidget(
              volume: Vector3(10, 10, 10),
              color: Colors.red,
              scale: Vector3.all(_controller.value * 0.5 + 1),
              rotation: Quaternion.axisAngle(
                  Vector3(0, 0, 1), _controller.value * 2 * pi),
            ),
          ],
        ),
        animation: _controller,
      ),
    );
  }
}
