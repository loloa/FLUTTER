import 'package:flutter/material.dart';

class Demobuttons extends StatefulWidget {
  const Demobuttons({super.key});

  @override
  State<Demobuttons> createState() {
    return _Demobuttons();
  }
}

class _Demobuttons extends State<Demobuttons> {
  var _isUnderstood = false;

  @override
  Widget build(context) {
    print('Demobuttons BUILD called');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = false;
                });
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = true;
                });
              },
              child: const Text('Yes'),
            ),
          ],
        ),
        if (_isUnderstood) const Text('Awesome!'),
      ],
    );
  }
}
