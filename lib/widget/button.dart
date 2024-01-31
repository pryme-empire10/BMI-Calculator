import 'package:flutter/material.dart';

import '../consts/app_colors.dart';


class Button extends StatelessWidget {

  final Widget child;
  final  VoidCallback onPressed;
  const Button({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        minimumSize: Size(MediaQuery.of(context).size.width, 60),
      ),
      onPressed: onPressed,
      child: child
    );
  }
}
