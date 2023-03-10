import 'package:flutter/material.dart';

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({
    Key? key,
  }) : super(key: key);

  @override
  _GreetingWidgetState createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget> {
  final globalKey = GlobalKey();
  bool isInno = false;

  // #29548
  // #c4bdc #c4bdc
  // #d39b2
  // #edfe5
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            isInno = !isInno;
          },
        );
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: isInno ? innoWidgets : flutterWidgets,
      ),
    );
  }

  Widget get innoWidgets => Container(
        child: Column(
          key: globalKey,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Icon(
              Icons.location_city,
              color: Colors.lightBlue,
              size: 56,
            ),
            SizedBox(height: 24),
            Text(
              'Hello Innopolis',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 56,
              ),
            ),
          ],
        ),
      );

  Widget get flutterWidgets => Column(
        key: globalKey,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const [
          Icon(
            Icons.flutter_dash,
            color: Colors.lightBlue,
            size: 56,
          ),
          SizedBox(height: 24),
          // Padding(padding: const EdgeInsets.only(bottom: 24)),
          Text(
            'Hello Flutter',
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 56,
            ),
          ),
        ],
      );
}
