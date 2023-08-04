import 'package:flutter/material.dart';
import 'package:ujian_dicoding_flutter/model/bmi_model.dart';

class CalculateBmiProvider extends ChangeNotifier {
  int weightVal = 25;
  int ageVal = 20;
  double sliderVal = 50.5;
  bool isMale = true;
  double result = 0.0;
  String categoryBmi = "";
  String rangeBmi = "";

  changeIsmale(bool value) {
    isMale = value;
    notifyListeners();
  }

  List<TableDataBMI> bmiTable = [
    TableDataBMI('Underweight', 0, 18.4),
    TableDataBMI('Normal Weight', 18.5, 24.9),
    TableDataBMI('Overweight', 25, 29.9),
    TableDataBMI('Obesity Class I', 30, 34.9),
    TableDataBMI('Obesity Class II', 35, 39.9),
    TableDataBMI('Obesity Class III', 40, double.infinity),
  ];

  double calculateDataBMI(double weight, double height) {
    if (height <= 0) return 0;
    return weight / (height * height);
  }

  String getCategoryBMI(double bmi) {
    for (var data in bmiTable) {
      if (bmi >= data.lowerLmt && bmi <= data.upperLmt) {
        rangeBmi = "Low : ${data.lowerLmt} - Max : ${data.upperLmt}";
        notifyListeners();
        return data.category;
      }
    }
    return 'Unknown data';
  }
}
