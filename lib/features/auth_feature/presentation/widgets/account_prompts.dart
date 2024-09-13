import 'package:flutter/material.dart';

import '../../../../core/helpers/navigation_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class AccountPrompts extends StatelessWidget {
  final String title, buttonTitle, route;
  const AccountPrompts({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.route,
  });

  factory AccountPrompts.login({
    required String route,
  }) =>
      AccountPrompts(
        title: 'Already have an account?',
        buttonTitle: 'Login',
        route: route,
      );
  factory AccountPrompts.signUp({
    required String route,
  }) =>
      AccountPrompts(
        title: "Don't have an account?",
        buttonTitle: 'Sign Up',
        route: route,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.cairoBlack(16, FontWeight.w400),
        ),
        8.setHorizontalSpace,
        InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          onTap: () {
            navigateTo(context, route, replace: true);
          },
          child: Text(
            buttonTitle,
            style: AppTextStyles.cairoBlack(16, FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
