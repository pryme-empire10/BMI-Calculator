import 'package:bmicalculator/consts/box_properties.dart';

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final BoxBorder? border;
  final VoidCallback? onTap;
  const CustomContainer({
    super.key,
    required this.child,
    this.color,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          decoration: BoxDecoration(
            color: color,
            border: border,
            borderRadius: BorderRadius.circular(customContainerRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
