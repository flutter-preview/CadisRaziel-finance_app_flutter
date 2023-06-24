import 'package:finance/core/shared/components/button/button_large.dart';
import 'package:finance/core/shared/components/textRich/multi_text_button.dart';
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
                 SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Image.asset(
                AppImages.man,
              ),  SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Text(
                "Gastar de forma inteligente e economizar mais",
                style: AppTextStyle.mediumText
                    .copyWith(color: AppColors.lightGreenTwo),
                textAlign: TextAlign.center,
              ),
             SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              ButtonLarge(
                  text: "Começar",
                  onPressed: () {
                    logger.i("Botão onboarding page funcionando");
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025  
              ),
              MultiTextButton(
                onPressed: () {},
                children: [
                  Text(
                    'Já tem uma conta? ',
                    style: AppTextStyle.smallText.copyWith(
                      color: AppColors.darkGrey,
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
             
            ],
          ),
        ),
      ),
    );
  }
}
