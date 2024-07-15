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

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _name = TextEditingController(text: 'Mr. Muffin');
  final TextEditingController _email = TextEditingController(text: 'mrmuff');
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

              /// Name & Email & Password Fields
              _buildForms(),
              SizedBox(height: 16.h),

              /// Already have an account button
              _alreadyHaveAccount(),
              SizedBox(height: 28.h),

              /// Signup button
              _signupButton(),
              SizedBox(height: 126.h),

              /// Login with social buttons
              const ContinueWithSocialAccount(title: 'Or sign up with social account'),
            ],
          ),
        ),
      ),
    );
  }

  /// Page Title
  Widget _buildTitle() {
    return const CustomPageTitleWidget(
      pageTitle: 'Sign Up',
      padding: EdgeInsets.zero,
    );
  }

  /// Name & Email & Password Fields
  Widget _buildForms() {
    return Column(
      children: [
        CustomTextFormField(
          controller: _name,
          label: 'Name',
          suffixIcon: const CustomSvgWidget(svg: Assets.zaraSvgCheckGreen),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: _email,
          label: 'Email',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
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

  /// Already have an account button
  Widget _alreadyHaveAccount() {
    return ForgotPasswordButton(
      title: 'Already have an account?',
      onTap: () {},
    );
  }

  /// Sign up Button
  Widget _signupButton() {
    return CustomElevatedButton(
      onPressed: () {},
      text: 'SIGN UP',
    );
  }
}
