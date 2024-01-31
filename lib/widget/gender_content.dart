import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts/app_colors.dart';

import '../consts/app_styles.dart';
import '../utils/custom_sizebox.dart';

class GenderContent extends StatelessWidget {
  final IconData icon;
  final String text;
  const GenderContent({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 70,
          color: AppColors.kWhiteColor,
        ),
        customSizeBox(height: 20),
        Text(
          text,
          style: AppStyles.kLabelTextStyles,
        ),
      ],
    );
  }
}
