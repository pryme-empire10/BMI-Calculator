import 'package:bmicalculator/model/bmi_model.dart';
import 'package:bmicalculator/view/page/result.dart';
import 'package:flutter/material.dart';

class BMIProvider extends ChangeNotifier {
  bool isLoading = false;

  void calculateBMIAndShowResult(BuildContext context, int height, int weight,
      int age, String gender, IconData iconGender) {
    try {
      BMI bmi = BMI(
        height: height,
        weight: weight,
      );
      isLoading = true;
      notifyListeners();
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Result(
            result: bmi.bmiCalculate(),
            height: height,
            weight: weight,
            age: age,
            gender: gender,
            iconGender: iconGender,
            bmiHeading: bmi.getResultHeading(),
            interpretation: bmi.getInterpretation(),
          ),
        ));

        isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      print('Error $e');
    }
  }
}
