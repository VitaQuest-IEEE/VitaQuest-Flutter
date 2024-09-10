import 'package:flutter/material.dart';
import 'package:vita_quest/core/helpers/navigation_helper.dart';
import 'package:vita_quest/core/helpers/spacing.dart';
import 'package:vita_quest/core/widgets/custom_button.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';

class RegistrationButtons extends StatelessWidget {
  const RegistrationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          buttonText: 'Sign Up',
          buttonAction: () {
            navigateTo(context, Routes.signUpScreen);
          },
          buttonStyle: AppTextStyles.cairoWhite(16, FontWeight.bold),
        ),
        16.setVerticalSpace,
        CustomButton(
          buttonText: 'Log In',
          buttonAction: () {
            navigateTo(context, Routes.loginScreen);
          },
          buttonStyle: AppTextStyles.cairoWhite(16, FontWeight.bold),
        ),
      ],
    );
  }
}
