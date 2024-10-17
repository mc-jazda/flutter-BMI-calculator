import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String text;
  final bool visible;

  const Alert({required this.text, required this.visible, super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      maintainSize: true,
      maintainState: true, // TO TEST
      maintainAnimation: true,
      child: Text(
        text,
      ),
    );
  }

}