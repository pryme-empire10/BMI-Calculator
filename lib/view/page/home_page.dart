import 'package:bmicalculator/consts/app_strings.dart';
import 'package:bmicalculator/consts/app_styles.dart';
import 'package:bmicalculator/provider/bmi_provider.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../consts/app_colors.dart';

import '../../data/user_data.dart';
import '../../utils/custom_sizebox.dart';
import '../../widget/button.dart';
import '../../widget/custom_slider.dart';
import '../../widget/gender_content.dart';
import '../../widget/custom_container.dart';
import '../../widget/round_button.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSliderHeight = currentSliderHeight;

  int _currentWeight = currentWeight;

  int _age = age;

  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    final currentBMI = Provider.of<BMIProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        title: Text(
          AppStrings.kAppBarText,
          style: AppStyles.kAppBarTextStyles,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                CustomContainer(
                  border: Border.all(
                    color: selectedGender == Gender.male
                        ? AppColors.kPrimaryColor
                        : AppColors.kInActiveColor,
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? AppColors.kActiveColor
                      : AppColors.kInActiveColor,
                  child: GenderContent(
                    icon: FontAwesomeIcons.person,
                    text: AppStrings.kMale,
                  ),
                ),
                CustomContainer(
                  border: Border.all(
                    color: selectedGender == Gender.female
                        ? AppColors.kPrimaryColor
                        : AppColors.kInActiveColor,
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? AppColors.kActiveColor
                      : AppColors.kInActiveColor,
                  child: GenderContent(
                    icon: FontAwesomeIcons.personDress,
                    text: AppStrings.kFemale,
                  ),
                )
              ],
            ),
          ),
          CustomContainer(
            color: AppColors.kInActiveColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppStrings.kHeight,
                  style: AppStyles.kLabelTextStyles,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      _currentSliderHeight.toStringAsFixed(0),
                      style: AppStyles.kLabelTextHeightStyles,
                    ),
                    Text(
                      AppStrings.kCm,
                      style: AppStyles.kLabelTextStyles,
                    ),
                  ],
                ),
                CustomSlider(
                  currentSliderHeight: _currentSliderHeight,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderHeight = value.toInt();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CustomContainer(
                  color: AppColors.kInActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.kWeight,
                        style: AppStyles.kLabelTextStyles,
                      ),
                      Text(
                        _currentWeight.toString(),
                        style: AppStyles.kLabelTextHeightStyles,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                _currentWeight--;
                              });
                            },
                          ),
                          customSizeBox(width: 10),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                _currentWeight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CustomContainer(
                  color: AppColors.kInActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.kAge,
                        style: AppStyles.kLabelTextStyles,
                      ),
                      Text(
                        _age.toString(),
                        style: AppStyles.kLabelTextHeightStyles,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                _age > 1 ? _age-- : _age = 1;
                              });
                            },
                          ),
                          customSizeBox(width: 10),
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                _age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Button(
            child: currentBMI.isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.kWhiteColor,
                    ),
                  )
                : Text(
                    AppStrings.kCalculateBMI,
                    style: AppStyles.kButtonTextStyles,
                  ),
            onPressed: () {
              if (selectedGender == null) {
                currentBMI.calculateBMIAndShowResult(
                  context,
                  _currentSliderHeight,
                  _currentWeight,
                  _age,
                  selectedGender == Gender.male
                      ? 'Gender not selected'
                      : 'Gender not selected',
                  selectedGender == Gender.male
                      ? FontAwesomeIcons.circleQuestion
                      : FontAwesomeIcons.circleQuestion,
                );
              } else {
                currentBMI.calculateBMIAndShowResult(
                  context,
                  _currentSliderHeight,
                  _currentWeight,
                  _age,
                  selectedGender == Gender.male ? 'Male' : 'Female',
                  selectedGender == Gender.male
                      ? FontAwesomeIcons.person
                      : FontAwesomeIcons.personDress,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
