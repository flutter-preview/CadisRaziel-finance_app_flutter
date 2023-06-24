import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class ButtonLarge extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const ButtonLarge({super.key, required this.text, this.onPressed});

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(24.0));
  @override
  Widget build(BuildContext context) {
    return Align(
          child: Material(
        color: Colors.transparent,
        child: Ink(
          height: 48.0,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: onPressed != null
                  ? AppColors.greenGradient
                  : AppColors.greyGradient,
            ),
          ),
          child: InkWell(
            borderRadius: _borderRadius,
            onTap: onPressed,
            child: Align(
              child: Text(
                text,
                style: AppTextStyle.buttonText.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
