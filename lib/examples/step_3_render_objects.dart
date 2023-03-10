import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class ReverseColumnExample extends StatelessWidget {
  const ReverseColumnExample({super.key});

  final style = const TextStyle(fontSize: 32);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Center(
            child: MyReverseColumnWidget(children: [
              Text(
                'Item 1',
                style: style,
              ),
              Text(
                'Item 2',
                style: style,
              ),
              Text(
                'Item 3',
                style: style,
              ),
            ]),
          ),
        ),
      );
}

class MyReverseColumnWidget extends MultiChildRenderObjectWidget {
  MyReverseColumnWidget({
    super.key,
    required super.children,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderFlex(
      direction: Axis.vertical,
      verticalDirection: VerticalDirection.up,
    );
  }
}

//Example for single child widget with RenderObject
class PerspectiveSample extends StatelessWidget {
  const PerspectiveSample({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: MyPerspectiveWidget(
          width: 256,
          height: 256,
          child: Container(
            width: 256,
            height: 256,
            color: Colors.white38,
            child: const FlutterLogo(size: 128),
          ),
        ),
      );
}

class MyPerspectiveWidget extends SingleChildRenderObjectWidget {
  final double angle;

  final double width;

  final double height;

  const MyPerspectiveWidget(
      {super.key,
      required this.width,
      required this.height,
      this.angle = pi / 4,
      required Widget child})
      : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTransform(
        transform: Matrix4.translation(Vector3(0, height / 2, 0))
            .multiplied(Matrix4.translation(Vector3(0, -height / 2, 0))
              ..setEntry(3, 2, 0.0015)
              ..rotateY(angle)));
  }
}

// Example for no-child widget (leaf) with RenderObject
class MyErrorWidget extends LeafRenderObjectWidget {
  final String message;

  const MyErrorWidget(this.message, {super.key});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderErrorBox(message);
}

class ErrorWidgetSample extends StatelessWidget {
  const ErrorWidgetSample({super.key});

  @override
  Widget build(BuildContext context) =>
      const MyErrorWidget("Everything is ok, it's just a demo");
}
