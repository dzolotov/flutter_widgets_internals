import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({Key? key}) : super(key: key);

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  double position = 100;
  double direction = 1;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(microseconds: 16667), (_) {
      setState(() {
        position += direction;
        if (position < 100 || position > 300) {
          direction = -direction;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugRepaintRainbowEnabled = true;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Positioned(
            top: position,
            child: AnimatedLogo(),
          ),
        ],
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build is called on ' + DateTime.now().toIso8601String());
    return FlutterLogo(
      size: 128,
    );
  }
}
