import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_page_title_widget.dart';
import 'package:my_theme/component/custom_svg_widget.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/custom_text_form_field.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';
import 'package:my_theme/core/validation/validation_functions.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController(text: 'email2');

  bool? isValidate;

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
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Page Title
              _buildTitle(),
              SizedBox(height: 72.v),

              /// Page Desc
              _buildDesc(),
              SizedBox(height: 16.v),

              /// Email Field
              _buildForms(),
              SizedBox(height: 55.h),

              /// Send button
              _sendButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Page Title
  Widget _buildTitle() {
    return const CustomPageTitleWidget(
      pageTitle: 'Forgot Password',
      padding: EdgeInsets.zero,
    );
  }

  /// Page Desc
  Widget _buildDesc() {
    return CustomText(
      text: 'Please, enter your email address. You will receive a link to create a new password via email.',
      fontSize: 14.fSize,
    );
  }

  /// Email Field
  Widget _buildForms() {
    return Column(
      children: [
        CustomTextFormField(
          controller: _email,
          validator: ValidationFunctions.emailValidator,
          unFocus: true,
          label: 'Email',
          suffixIcon: (_formKey.currentState?.validate() != null && _formKey.currentState!.validate())
              ? const CustomSvgWidget(svg: Assets.zaraSvgCheckGreen)
              : const CustomSvgWidget(svg: Assets.zaraSvgRedClose),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }

  /// Send button
  Widget _sendButton() {
    return CustomElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            isValidate = true;
          });
        } else {
          setState(() {
            isValidate = false;
          });
        }
      },
      text: 'SEND',
    );
  }
}
