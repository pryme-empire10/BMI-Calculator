import 'package:flutter/material.dart';

import '../consts/app_styles.dart';

class ResultHeader extends StatelessWidget {
  const ResultHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 30),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Result',
          style: AppStyles.kAppBarTextStyles.copyWith(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
