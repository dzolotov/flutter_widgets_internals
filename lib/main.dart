import 'package:flutter/widgets.dart';
import 'package:flutter_widgets_internals/examples/step_0_animated_box.dart';
import 'package:flutter_widgets_internals/examples/step_6_semantics.dart';
import 'package:flutter_widgets_internals/examples/step_9_custom_render_objects.dart';

import 'examples/step_1_greeting.dart';
import 'examples/step_2_greeting.dart';
import 'examples/step_3_render_objects.dart';
import 'examples/step_4_gestures.dart';
import 'examples/step_5_paint.dart';
import 'examples/step_7_custom_layout.dart';
import 'examples/step_8_render_proxy_box.dart';

enum ExampleType {
  step0AnimatedBox,
  step1Greeting,
  step2Greeting,
  step31LeafRenderObject,
  step32SingleChildRenderObject,
  step33MultiChildRenderObject,
  step4Gestures,
  step5Paint,
  step6Semantics,
  step7CustomLayout,
  step8RenderProxyBox,
  step9CustomRenderObject,
}

void main() {
  const example = ExampleType.step0AnimatedBox;
  late Widget app;

  switch (example) {
    case ExampleType.step0AnimatedBox:
      app = const AnimatedBox();
      break;

    case ExampleType.step1Greeting:
      app = greeting;
      break;

    case ExampleType.step2Greeting:
      app = const GreetingWidget();
      break;

    case ExampleType.step31LeafRenderObject:
      app = const ErrorWidgetSample();
      break;

    case ExampleType.step32SingleChildRenderObject:
      app = const PerspectiveSample();
      break;

    case ExampleType.step33MultiChildRenderObject:
      app = const ReverseColumnExample();
      break;

    case ExampleType.step4Gestures:
      app = const GesturesApp();
      break;

    case ExampleType.step5Paint:
      app = const PaintApp();
      break;

    case ExampleType.step6Semantics:
      app = const SemanticsApp();
      break;

    case ExampleType.step7CustomLayout:
      app = const CustomLayoutApp();
      break;

    case ExampleType.step8RenderProxyBox:
      app = const RenderProxyBoxApp();
      break;

    case ExampleType.step9CustomRenderObject:
      app = const SphereSample();
      break;
  }

  runApp(app);
}
