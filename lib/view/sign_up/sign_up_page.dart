import 'package:finance/core/shared/components/bottom_sheet/custom_modal_bottom_sheet.dart';
import 'package:finance/core/shared/components/button/button_large.dart';
import 'package:finance/core/shared/components/circular_progress_indicator/custom_circular_progress_indicator.dart';
import 'package:finance/core/shared/components/textFormField/custom_password_text_form_field.dart';
import 'package:finance/core/shared/components/textFormField/custom_text_form_field.dart';
import 'package:finance/core/shared/components/textRich/multi_text_button.dart';
import 'package:finance/core/shared/constants/app_colors.dart';
import 'package:finance/core/shared/constants/app_images.dart';
import 'package:finance/core/shared/constants/app_text_style.dart';
import 'package:finance/core/shared/routes/named_routes.dart';
import 'package:finance/core/shared/utils/validator_text_field/validators.dart';
import 'package:finance/locator.dart';
import 'package:finance/view/sign_up/sign_up_controller.dart';
import 'package:finance/view/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var logger = Logger();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignUpController>(); // O locator é do getIt ele vai ser responsavel por ir atras do controller 



  @override
  void initState() {
    _controller.addListener(() {
      // logger.i(_controller.state.toString());
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const CustomCircularProgressIndicator(),
        );
      }
      if (_controller.state is SignUpSucessState) {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(NamedRoute.homePage);
      }
      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
        Navigator.of(context).pop();
        customModalBottomSheet(context,content: error.message);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollConfiguration(
      behavior: const MaterialScrollBehavior()
          .copyWith(overscroll: false), //Remove glow scroll
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            "comece a economizar\nseu dinheiro",
            style: AppTextStyle.mediumText
                .copyWith(color: AppColors.lightGreenTwo),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Image.asset(
            AppImages.signUpImage,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: "Nome*",
                  hintText: "John Doe",
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  validator: Validators.validateName,
                ),
                 CustomTextFormField(
                  controller: _emailController,
                  labelText: "E-mail*",
                  hintText: "johndoe@email.com",
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  validator: Validators.validateEmail,
                ),
                CustomPasswordTextFormField(
                  controller: _passwordController,
                  helperText:
                      "A senha deve ter no minimo 8 caracteres, uma letra maiuscula e um numero",
                  labelText: "Senha*",
                  hintText: "Insira sua senha",
                  textInputAction: TextInputAction.done,
                  validator: Validators.validatePassword,
                ),
                CustomPasswordTextFormField(
                  labelText: "Confirmar senha*",
                  hintText: "Confirme sua senha",
                  textInputAction: TextInputAction.done,
                  validator: (value) => Validators.validateConfirmPassword(
                    _passwordController.text,
                    value,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          ButtonLarge(
              text: "Registrar",
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );                  
                } else {
                  logger.i("Botão de registrar pressionado validator ERRADO");
                }
              }),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          MultiTextButton(
            onPressed: () =>  Navigator.of(context).popAndPushNamed(NamedRoute.signIn),
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
    ));
  }
}
