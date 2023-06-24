import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? helperText;
  
  const CustomTextFormField(
      {super.key,
      this.padding,
      this.hintText,
      this.labelText,
      this.textCapitalization,
      this.controller, this.keyboardType, this.maxLength, this.textInputAction, this.suffixIcon, this.obscureText, this.validator, this.helperText});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  String? _helperText;
  @override
  void initState() {
    _helperText = widget.helperText;
    super.initState();
  }

  final defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(
    color: AppColors.lightGreenTwo,
  ));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextFormField(
        onChanged: (value){
          if(value.length == 1){
            setState(() {
              _helperText = null;
            });
          } else if(value.isEmpty){
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        validator: widget.validator,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: widget.maxLength,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          helperText: _helperText,        
          helperMaxLines: 2,
          helperStyle:  AppTextStyle.inputHelperText,
          errorStyle:  AppTextStyle.inputHelperText,
          errorMaxLines: 2,
          suffixIcon: widget.suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: AppTextStyle.inputLabelText.copyWith(
            color: AppColors.grey,
          ),
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(
            color: AppColors.red,
          )),
          focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(
            color: AppColors.red,
          )),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
