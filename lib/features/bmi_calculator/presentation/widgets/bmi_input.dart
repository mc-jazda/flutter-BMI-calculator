import 'package:flutter/material.dart';

class BmiInput extends StatefulWidget {
  final String text;

  const BmiInput({required this.text, super.key});

  @override
  State<StatefulWidget> createState() => BmiInputState();
}

class BmiInputState extends State<BmiInput> {
  final controller = TextEditingController();
  String inputStr = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              inputStr = value;
            },
          )
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}