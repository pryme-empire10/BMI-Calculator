import 'package:flutter/material.dart';

import '../consts/app_styles.dart';

class CustomSelector extends StatelessWidget {
  final String text;
  final String textNumber;
  final Widget child;
  const CustomSelector(
      {super.key,
      required this.text,
      required this.textNumber,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppStyles.kLabelTextStyles,
        ),
        Text(
          textNumber,
          style: AppStyles.kLabelTextHeightStyles,
        ),
        child
      ],
    );
  }
}
