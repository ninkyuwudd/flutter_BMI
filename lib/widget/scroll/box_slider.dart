import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ujian_dicoding_flutter/provider/calculate_bmi_provider.dart';
import 'package:ujian_dicoding_flutter/widget/text/gray_title_text.dart';
import 'package:ujian_dicoding_flutter/widget/text/higlight_value_text.dart';

class BoxSliderNumber extends StatefulWidget {
  const BoxSliderNumber({super.key});

  @override
  State<BoxSliderNumber> createState() => _BoxSliderNumberState();
}

class _BoxSliderNumberState extends State<BoxSliderNumber> {
  @override
  Widget build(BuildContext context) {
    var loadBmiVal = Provider.of<CalculateBmiProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2))
        ],
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GrayTitleText(text: "HEIGHT"),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HightLigthValueText(
                  text: loadBmiVal.sliderVal.toStringAsFixed(1)),
              Text("cm")
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor:
                  Colors.amber, // Change the active track color here
              inactiveTrackColor:
                  Colors.grey, // Change the inactive track color here
              thumbColor: Colors.amber.shade800, // Change the thumb color here
              overlayColor:
                  Colors.amber.withAlpha(100), // Change the overlay color here
              valueIndicatorColor:
                  Colors.green, // Change the value indicator color here
            ),
            child: Slider(
                min: 0,
                max: 300,
                value: loadBmiVal.sliderVal,
                onChanged: (double value) {
                  setState(() {
                    loadBmiVal.sliderVal = value;
                  });
                }),
          )
        ],
      )),
    );
  }
}
