import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class SocialIntegration extends StatelessWidget {
  final void Function() googleIntegration, faceBookIntegration;
  const SocialIntegration(
      {super.key,
      required this.googleIntegration,
      required this.faceBookIntegration});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton.notFilled(
          buttonAction: googleIntegration,
          borderColor: AppColors.mainGreenColor,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.svgsGoogle),
              8.horizontalSpace,
              Text(
                'Continue with google',
                style: AppTextStyles.cairoBlack(16, FontWeight.w400),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        CustomButton.notFilled(
          buttonAction: faceBookIntegration,
          borderColor: AppColors.mainGreenColor,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.svgsFacabook),
              8.horizontalSpace,
              Text(
                'Continue with facebook',
                style: AppTextStyles.cairoBlack(16, FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
