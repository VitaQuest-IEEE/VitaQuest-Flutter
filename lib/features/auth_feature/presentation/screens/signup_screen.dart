import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vita_quest/core/helpers/spacing.dart';

import '../../../../core/errors/messages/validation_error_messages.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/account_prompts.dart';
import '../widgets/auth_back_button.dart';
import '../widgets/auth_container.dart';
import '../widgets/continue_with.dart';
import '../widgets/social_integration.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ToDO move them in the cubit.
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    //? ==========================================================================
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthBackButton(page: 'signUp'),
            8.setVerticalSpace,
            AuthContainer(
              widget: Padding(
                padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: Text(
                            'Sign Up',
                            style:
                                AppTextStyles.cairoBlack(32, FontWeight.w500),
                          ),
                        ),
                        32.setVerticalSpace,
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Expanded(
                              child: CustomTFF(
                                hintText: 'First Name',
                                kbType: TextInputType.name,
                                controller: firstNameController,
                                validate: (firstName) =>
                                    ValidationErrorTexts.firstNameValidation(
                                        firstName),
                              ),
                            ),
                            16.setHorizontalSpace,
                            Expanded(
                              child: CustomTFF(
                                hintText: 'Last name',
                                kbType: TextInputType.name,
                                controller: lastNameController,
                                validate: (lastName) =>
                                    ValidationErrorTexts.lastNameValidation(
                                        lastName),
                              ),
                            ),
                          ],
                        ),
                        16.setVerticalSpace,
                        CustomTFF(
                          hintText: 'Email',
                          kbType: TextInputType.emailAddress,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(14.r),
                            child: SvgPicture.asset(Assets.iconsEmail),
                          ),
                          controller: emailController,
                          validate: (email) =>
                              ValidationErrorTexts.emailValidation(email),
                        ),
                        16.setVerticalSpace,
                        CustomTFF(
                          hintText: 'Password',
                          kbType: TextInputType.visiblePassword,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(14.r),
                            child: SvgPicture.asset(Assets.iconsLock),
                          ),
                          controller: passwordController,
                          validate: (password) =>
                              ValidationErrorTexts.signUpPasswordValidation(
                                  password),
                        ),
                        16.setVerticalSpace,
                        CustomTFF(
                          hintText: 'Confirm Password',
                          kbType: TextInputType.visiblePassword,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(14.r),
                            child: SvgPicture.asset(Assets.iconsLock),
                          ),
                          controller: confirmPasswordController,
                          validate: (confirmPassword) =>
                              ValidationErrorTexts.confirmPasswordValidation(
                            confirmPassword,
                            passwordController.text,
                          ),
                        ),
                        16.setVerticalSpace,
                        Hero(
                          tag: 'signUp',
                          child: CustomButton(
                            buttonAction: () {
                              if (formKey.currentState!.validate()) {}
                            },
                            buttonText: 'Sign Up',
                            buttonStyle:
                                AppTextStyles.cairoWhite(16, FontWeight.w700),
                          ),
                        ),
                        16.setVerticalSpace,
                        const ContinueWith(),
                        16.verticalSpace,
                        SocialIntegration(
                          faceBookIntegration: () {},
                          googleIntegration: () {},
                        ),
                        24.setVerticalSpace,
                        AccountPrompts.login(route: Routes.loginScreen),
                        16.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
