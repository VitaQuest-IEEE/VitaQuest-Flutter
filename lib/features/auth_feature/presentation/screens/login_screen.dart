import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vita_quest/core/errors/messages/validation_error_messages.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/account_prompts.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/auth_container.dart';
import '../widgets/continue_with.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/auth_back_button.dart';
import '../widgets/remember_me.dart';
import '../widgets/social_integration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ToDO move them in the cubit.
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    //? ==========================================================================
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthBackButton(page: 'login'),
            24.setVerticalSpace,
            AuthContainer(
              widget: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 80.h),
                          child: Text(
                            'Login',
                            style:
                                AppTextStyles.cairoBlack(32, FontWeight.w500),
                          ),
                        ),
                        32.setVerticalSpace,
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
                              ValidationErrorTexts.loginPasswordValidation(
                                  password),
                        ),
                        8.setVerticalSpace,
                        Row(
                          children: [
                            const RememberMe(),
                            const Spacer(),
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              child: Text(
                                'Forget Password?',
                                style: AppTextStyles.cairoBlack(
                                    14, FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        16.setVerticalSpace,
                        Hero(
                          tag: 'login',
                          child: CustomButton(
                            buttonAction: () {
                              if (formKey.currentState!.validate()) {}
                            },
                            buttonText: 'Login',
                            buttonStyle:
                                AppTextStyles.cairoWhite(16, FontWeight.w700),
                          ),
                        ),
                        16.verticalSpace,
                        const ContinueWith(),
                        16.verticalSpace,
                        SocialIntegration(
                          faceBookIntegration: () {},
                          googleIntegration: () {},
                        ),
                        32.verticalSpace,
                        AccountPrompts.signUp(route: Routes.signUpScreen),
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
