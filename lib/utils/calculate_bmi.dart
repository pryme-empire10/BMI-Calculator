// class CalculateBMI{
//   BMI bmi = BMI(
//                 height: _currentSliderHeight.toInt(),
//                 weight: _currentWeight,
//               );

//               setState(() {
//                 isLoading = true;
//               });
//               Future.delayed(const Duration(seconds: 3), () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => Result(
//                     result: bmi.bmiCalculate(),
//                     height: _currentSliderHeight,
//                     weight: _currentWeight,
//                     age: age,
//                     bmiHeading: bmi.getResultHeading(),
//                     interpretation: bmi.getInterpretation(),
//                   ),
//                 ));
//                 setState(() {
//                   isLoading = false;
//                 });
//               });
// }