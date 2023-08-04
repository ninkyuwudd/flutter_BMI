import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ujian_dicoding_flutter/widget/text/gray_title_text.dart';
import 'package:ujian_dicoding_flutter/widget/text/higlight_value_text.dart';

import '../../provider/calculate_bmi_provider.dart';

class PlusMinDisplay extends StatefulWidget {
  final String title;
  const PlusMinDisplay({super.key, required this.title});

  @override
  State<PlusMinDisplay> createState() => _PlusMinDisplayState();
}

class _PlusMinDisplayState extends State<PlusMinDisplay> {
  @override
  Widget build(BuildContext context) {
    var loadBmiVal = Provider.of<CalculateBmiProvider>(context);
    var weightVal = loadBmiVal.weightVal;
    var ageVal = loadBmiVal.ageVal;
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30,
      height: MediaQuery.of(context).size.height / 4 + 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GrayTitleText(text: widget.title),
          HightLigthValueText(
              text: widget.title == "WEIGHT"
                  ? weightVal.toString()
                  : ageVal.toString()),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.title == "WEIGHT") {
                          loadBmiVal.weightVal -= 1;
                        } else {
                          loadBmiVal.ageVal -= 1;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove),
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.title == "WEIGHT") {
                          loadBmiVal.weightVal += 1;
                          print("+1");
                        } else {
                          loadBmiVal.ageVal += 1;
                        }
                      });
                      // ignore: unrelated_type_equality_checks
                    },
                    icon: const Icon(Icons.add),
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
