import 'package:flutter/material.dart';

class SemanticsApp extends StatefulWidget {
  const SemanticsApp({
    Key? key,
  }) : super(key: key);

  @override
  _SemanticsAppState createState() => _SemanticsAppState();
}

class _SemanticsAppState extends State<SemanticsApp> {
  final globalKey = GlobalKey();
  bool isInno = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      home: isInno ? innoWidgets : flutterWidgets,
    );
  }

  Widget get innoWidgets => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Semantics(
            label: 'I am an Innopolis',
            child: const Icon(
              Icons.location_city,
              color: Colors.lightBlue,
              size: 56,
            ),
          ),
          const ExcludeSemantics(child: SizedBox(height: 24)),
          Semantics(
            hint: 'Tap me to switch mode',
            child: TextButton(
              onPressed: () => setState(
                () => isInno = !isInno,
              ),
              child: const Text(
                'Hello Innopolis',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 56,
                ),
              ),
            ),
          ),
        ],
      );

  Widget get flutterWidgets => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Semantics(
            label: 'I am a Dash',
            child: const Icon(
              Icons.flutter_dash,
              color: Colors.lightBlue,
              size: 56,
            ),
          ),
          const ExcludeSemantics(child: SizedBox(height: 24)),
          // Padding(padding: const EdgeInsets.only(bottom: 24)),
          Semantics(
            hint: 'Tap me to switch mode',
            child: TextButton(
              onPressed: () => setState(
                () => isInno = !isInno,
              ),
              child: const Text(
                'Hello Flutter',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 56,
                ),
              ),
            ),
          ),
        ],
      );
}
