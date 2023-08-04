import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ujian_dicoding_flutter/widget/button/plus_min_display.dart';
import 'package:ujian_dicoding_flutter/widget/button/square_btn_icon.dart';
import 'package:ujian_dicoding_flutter/widget/scroll/box_slider.dart';

import '../provider/calculate_bmi_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var loadBmiVal = Provider.of<CalculateBmiProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SquareButtonIcon(text: "Male", inputIcon: Icons.male),
                SquareButtonIcon(text: "Female", inputIcon: Icons.female)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10 - 50,
            ),
            BoxSliderNumber(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10 - 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlusMinDisplay(
                  title: "WEIGHT",
                ),
                PlusMinDisplay(
                  title: "AGE",
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10 - 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  onPressed: () {
                    var countBmi = loadBmiVal.calculateDataBMI(
                        double.parse(loadBmiVal.weightVal.toString()),
                        loadBmiVal.sliderVal / 100);
                    loadBmiVal.result = countBmi;
                    loadBmiVal.categoryBmi =
                        loadBmiVal.getCategoryBMI(countBmi);
                    print(loadBmiVal.weightVal);
                    print(loadBmiVal.sliderVal);
                    print(countBmi);
                    print(loadBmiVal.categoryBmi);
                    Navigator.pushNamed(context, "/result");
                  },
                  child: Text(
                    "Count",
                    style: TextStyle(color: Colors.amber),
                  )),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                "Reihan Wudd",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
