import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {

  const CustomCircularProgressIndicator({ super.key });

   @override
   Widget build(BuildContext context) {
       return const Center(
         child:  CircularProgressIndicator(
          color: AppColors.lightGreenOne,
         ),
       );
  }
}