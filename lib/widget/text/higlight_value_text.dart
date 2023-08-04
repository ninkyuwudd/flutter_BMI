import 'package:flutter/material.dart';

class HightLigthValueText extends StatelessWidget {
  final String text;
  const HightLigthValueText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ));
  }
}
