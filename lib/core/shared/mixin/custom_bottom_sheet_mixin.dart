import 'package:finance/core/shared/components/button/button_large.dart';
import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:flutter/material.dart';

mixin CustomModalSheetMixin<T extends StatefulWidget> on State<T> {
  Future<bool?> showCustomModalBottomSheet({
    required BuildContext context,
    required String content,
    String? buttonText,
    VoidCallback? onPressed,
    List<Widget>? actions,
    bool isDismissible = true,
  }) {
    assert(buttonText != null || actions != null);

    return showModalBottomSheet(
      isDismissible: isDismissible,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(38.0),
          topRight: Radius.circular(38.0),
        ),
      ),
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(isDismissible),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38.0),
                topRight: Radius.circular(38.0),
              ),
            ),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  child: Text(
                    content,
                    style: AppTextStyle.smallText
                        .copyWith(color: AppColors.darkGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 32.0,
                  ),
                  child: actions != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: actions,
                        )
                      : ButtonLarge(
                          text: buttonText!,
                          onPressed: onPressed ?? () => Navigator.pop(context),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
