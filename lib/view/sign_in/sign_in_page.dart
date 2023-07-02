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
import 'package:finance/view/home/home_page.dart';
import 'package:finance/view/sign_in/sign_in_controller.dart';
import 'package:finance/view/sign_in/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var logger = Logger();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignInController>(); // O locator é do getIt ele vai ser responsavel por ir atras do controller 
      
  @override
  void initState() {
    _controller.addListener(() {
      // logger.i(_controller.state.toString());
      if (_controller.state is SignInLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const CustomCircularProgressIndicator(),
        );
      }
      if (_controller.state is SignInSucessState) {
        Navigator.of(context).pop();
        //pushReplacementNamed -> quando avança para a proxima tela, ele não deixa voltar para a tela anterior
        Navigator.of(context).pushReplacementNamed(NamedRoute.homePage);
      }
      if (_controller.state is SignInErrorState) {
        final error = _controller.state as SignInErrorState;
        Navigator.of(context).pop();
        customModalBottomSheet(context, content: error.message);
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
            AppImages.signInImage,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
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
                  labelText: "Senha*",
                  hintText: "Insira sua senha",
                  textInputAction: TextInputAction.done,
                  validator: Validators.validatePassword,
                ),
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
                  _controller.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  logger.i("Botão de registrar pressionado validator ERRADO");
                }
              }),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          MultiTextButton(
               onPressed: () =>  Navigator.of(context).popAndPushNamed(NamedRoute.signUp),
            children: [
              Text(
                'Nao tem uma conta? ',
                style: AppTextStyle.smallText.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
              Text(
                'crie uma agora',
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
