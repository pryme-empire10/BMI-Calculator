import 'package:flutter/material.dart';

import '../consts/app_colors.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.onChanged,
    required int currentSliderHeight,
  }) : _currentSliderHeight = currentSliderHeight;

  final int _currentSliderHeight;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        overlayColor: AppColors.kPrimaryColor.withOpacity(0.2),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
        thumbColor: AppColors.kPrimaryColor,
        activeTrackColor: AppColors.kWhiteColor,
        inactiveTrackColor: AppColors.kWhiteColor.withOpacity(0.3),
      ),
      child: Slider(
        value: _currentSliderHeight.toDouble(),
        max: 220,
        min: 120,
        onChanged: onChanged,
      ),
    );
  }
}
