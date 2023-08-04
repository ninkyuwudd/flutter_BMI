import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/calculate_bmi_provider.dart';

class SquareButtonIcon extends StatelessWidget {
  final String text;
  final IconData inputIcon;
  const SquareButtonIcon(
      {super.key, required this.text, required this.inputIcon});

  @override
  Widget build(BuildContext context) {
    var loadBmiVal = Provider.of<CalculateBmiProvider>(context);
    var getChFunc = loadBmiVal.changeIsmale;
    return Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: MediaQuery.of(context).size.height / 4 - 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: loadBmiVal.isMale == true && text == "Male"
                ? Colors.black87
                : loadBmiVal.isMale == false && text == "Female"
                    ? Colors.black87
                    : Colors.black54,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ]),
        child: TextButton.icon(
            onPressed: () {
              if (text == "Male") {
                getChFunc(true);
              } else {
                getChFunc(false);
              }
            },
            icon: Icon(
              inputIcon,
              color: Colors.white,
            ),
            label: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.amber),
            )));
  }
}
