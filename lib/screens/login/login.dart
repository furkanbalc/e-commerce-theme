import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_page_title_widget.dart';
import 'package:my_theme/component/login_signup/continue_with_social_account.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_svg_widget.dart';
import 'package:my_theme/component/custom_text_form_field.dart';
import 'package:my_theme/component/login_signup/forgot_password_button.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';
import 'package:my_theme/core/validation/validation_functions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController(text: 'muffin.sweet@gmail.com');
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const CustomAppBar(arrowBack: true),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.v),
      child: Form(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              _buildTitle(),
              SizedBox(height: 72.v),

              /// Email & Password Fields
              _buildForms(),
              SizedBox(height: 16.h),

              /// Forgot your password
              _forgotYourPassword(),
              SizedBox(height: 32.h),

              /// Login button
              _loginButton(),
              SizedBox(height: 194.h),

              /// Login with social buttons
              const ContinueWithSocialAccount(title: 'Or login with social account'),
            ],
          ),
        ),
      ),
    );
  }

  /// Page Title
  Widget _buildTitle() {
    return const CustomPageTitleWidget(
      pageTitle: 'Login',
      padding: EdgeInsets.zero,
    );
  }

  /// Email & Password Fields
  Widget _buildForms() {
    return Column(
      children: [
         CustomTextFormField(
          controller: _email,
          validator: ValidationFunctions.emailValidator,
          label: 'Email',
          suffixIcon: const CustomSvgWidget(svg: Assets.zaraSvgCheckGreen),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 8.h),
         CustomTextFormField(
           controller: _password,
          obscureText: true,
          label: 'Password',
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }

  /// Forgot your password
  Widget _forgotYourPassword() {
    return ForgotPasswordButton(
      title: 'Forgot your password',
      onTap: () {},
    );
  }

  /// Login Button
  Widget _loginButton() {
    return CustomElevatedButton(
      onPressed: () {},
      text: 'LOGIN',
    );
  }
}
