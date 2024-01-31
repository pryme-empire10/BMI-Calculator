import 'package:bmicalculator/consts/app_colors.dart';
import 'package:bmicalculator/consts/app_strings.dart';
import 'package:bmicalculator/consts/app_styles.dart';
import 'package:bmicalculator/utils/custom_sizebox.dart';

import 'package:bmicalculator/widget/button.dart';
import 'package:bmicalculator/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widget/result_header.dart';
import '../../widget/user_info_details.dart';

class Result extends StatelessWidget {
  final String result;
  final int height;
  final int weight;
  final int age;
  final String bmiHeading;
  final String interpretation;
  final String gender;
  final IconData iconGender;
  const Result({
    super.key,
    required this.result,
    required this.height,
    required this.weight,
    required this.age,
    required this.bmiHeading,
    required this.interpretation,
    required this.gender,
    required this.iconGender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ResultHeader(),
            CustomContainer(
              color: AppColors.kInActiveColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiHeading,
                      style: AppStyles.kAppBarTextStyles,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        result,
                        style: AppStyles.kLabelTextHeightStyles,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.kTextColor.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                iconGender,
                                size: 25,
                                color: AppColors.kWhiteColor,
                              ),
                              customSizeBox(height: 11),
                              Text(
                                gender,
                                style: AppStyles.kLabelTextStyles
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                          UserInfoDetails(number: age, text: AppStrings.kAge),
                          UserInfoDetails(
                              number: height, text: AppStrings.kHeight),
                          UserInfoDetails(
                              number: weight, text: AppStrings.kWeight),
                        ],
                      ),
                    ),
                    Text(
                      interpretation,
                      style: AppStyles.kLabelTextStyles.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 400 ? 12 : 16,
                        color: AppColors.kWhiteColor,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Button(
              child: Text(
                AppStrings.kRecalculate,
                style: AppStyles.kButtonTextStyles,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
