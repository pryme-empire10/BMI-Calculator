import 'dart:math';

class BMI {
  final int height;
  final int weight;
  late double _bmi;

  BMI({
    required this.height,
    required this.weight,
  });

  String bmiCalculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  double get bmi => _bmi;

  String getResultHeading() {
    if (bmi < 18.5) {
      return 'UnderWeight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "OverWeight";
    } else if (bmi >= 30 && bmi <= 39.9) {
      return "Obesity";
    } else {
      return "Severely obesity";
    }
  }

  String getInterpretation() {
    if (bmi < 18.5) {
      return "It's important to pay attention to your health.\n\nConsider incorporating nutrient-rich foods into your diet to ensure you're getting the essential nutrients your body needs.\n\nConsult with a healthcare professional for personalized advice and guidance on achieving a healthy weight.";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Congratulations! Your BMI falls within the normal weight range.\n\nMaintaining a healthy weight reduces your risk of chronic diseases like heart disease, diabetes, and some cancers.\n\nKeep up the good work!";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "You are in the overweight category.\n\nWhile not necessarily indicating immediate health risks, being overweight can increase your risk of developing chronic diseases in the long term.\nConsider focusing on healthy eating and regular physical activity to manage your weight and improve overall health.";
    } else if (bmi >= 30 && bmi <= 39.9) {
      return "Obesity can significantly increase your risk of serious health problems like heart disease, stroke, type 2 diabetes, and certain cancers.\n\nIt's highly recommended to consult a healthcare professional to discuss weight management strategies and potential health risks.";
    } else {
      return "This is a serious health concern.\n\nThis significantly increases your risk of developing serious and potentially life-threatening health conditions.\n\nConsulting a healthcare professional immediately is crucial to develop a personalized weight management plan and address potential health concerns.";
    }
  }
}
