import 'package:flutter/material.dart';

import '../consts/app_styles.dart';
import '../utils/custom_sizebox.dart';

class UserInfoDetails extends StatelessWidget {
  const UserInfoDetails({
    super.key,
    required this.number,
    required this.text,
  });

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          number.toString(),
          style: AppStyles.kUserInfoStyles
        ),
        customSizeBox(height: 9),
        Text(
          text,
          style: AppStyles.kLabelTextStyles.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
