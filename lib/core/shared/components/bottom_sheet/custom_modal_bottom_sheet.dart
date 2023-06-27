import 'package:finance/core/shared/components/button/button_large.dart';
import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:flutter/material.dart';

Future<void> customModalBottomSheet(BuildContext context, {required String content}) {
 return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(38),
        topRight: Radius.circular(38),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38),
            topRight: Radius.circular(38),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                content,
                style:
                    AppTextStyle.errorTextTryAgain.copyWith(color: AppColors.lightGreenOne),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonLarge(
                  text: "Tentar novamente",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      );
    },
  );
}
