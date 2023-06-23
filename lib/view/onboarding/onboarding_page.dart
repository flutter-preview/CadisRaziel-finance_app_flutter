import 'package:finance/core/shared/components/button_large.dart';
import 'package:finance/core/shared/components/multi_text_button.dart';
import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_images.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();

    return Scaffold(
      body: SafeArea(
        child: Align(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: AppColors.iceWhite,
                  child: Image.asset(
                    AppImages.man,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Gastar de forma inteligente e economizar mais",
                  style: AppTextStyle.mediumText
                      .copyWith(color: AppColors.lightGreenTwo),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonLarge(
                  text: "Começar",
                  onPressed: () {
                    logger.i("Botão funcionando");
                  }),
              const SizedBox(
                height: 16,
              ),
              MultiTextButton(
                onPressed: () {},
                children: [
                  Text(
                    'Já tem uma conta? ',
                    style: AppTextStyle.smallText.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  Text( 
                    'faça o login ',
                    style: AppTextStyle.smallText.copyWith(
                      color: AppColors.lightGreenOne,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
