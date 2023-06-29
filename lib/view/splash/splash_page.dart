import 'dart:async';

import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:finance/core/shared/routes/named_routes.dart';
import 'package:finance/view/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Timer init(){
    return Timer(const Duration(seconds: 2), navigateToOnboarding);
  }

  void navigateToOnboarding(){
     Navigator.of(context).pushReplacementNamed(NamedRoute.initial);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          ),
        ),
        child: Center(
          child: Text(
            "Finanças",
            style: AppTextStyle.bigText.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
