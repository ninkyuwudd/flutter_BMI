import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/calculate_bmi_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loadBmiVal = Provider.of<CalculateBmiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("YOUR RESULT",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              padding:
                  EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black87,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3))
                  ]),
              child: Column(
                children: [
                  Text(
                    loadBmiVal.categoryBmi,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    loadBmiVal.result.toStringAsFixed(1),
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 70,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("BMI range:",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(loadBmiVal.rangeBmi,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text("Gender",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(loadBmiVal.isMale ? "Male" : "Female",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          const Text("Age",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(loadBmiVal.ageVal.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
