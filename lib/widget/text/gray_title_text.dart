import 'package:flutter/material.dart';

class GrayTitleText extends StatelessWidget {
  final String text;
  const GrayTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black54),
    );
  }
}
