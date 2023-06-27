import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle bigText =
      TextStyle(fontSize: 50, fontWeight: FontWeight.w700, fontFamily: "Inter");

  static const TextStyle mediumText =
      TextStyle(fontSize: 28, fontWeight: FontWeight.w700, fontFamily: "Inter");

  static const TextStyle smallText =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Inter");

  static const TextStyle buttonText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Inter");

  static const TextStyle inputLabelText =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Inter");
  static const TextStyle inputHintText =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "Inter");
  static const TextStyle inputHelperText =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "Inter", color: AppColors.lightGreenTwo);

  static const TextStyle errorTextTryAgain =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Inter", color: AppColors.lightGreenTwo);
}
