import 'package:finance/core/shared/components/textFormField/custom_text_form_field.dart';
import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final int? maxLength;
   final String? Function(String?)? validator;
   final String? helperText; 

  const CustomPasswordTextFormField({
    super.key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.textInputAction, this.validator, this.helperText, 
  });

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) { 
    return CustomTextFormField(
    
      helperText: widget.helperText,
      validator: widget.validator,
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      suffixIcon: InkWell(        
        borderRadius: BorderRadius.circular(23),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon( isHidden ? Icons.visibility :
          Icons.visibility_off, color: AppColors.lightGreenTwo,
        ),
      ),
    );
  }
}
