import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vita_quest/core/theme/app_text_styles.dart';
import 'package:vita_quest/core/widgets/custom_button.dart';

import '../presentation_logic_holder/on_boarding_cubit.dart';

class OnBoardingActionButtons extends StatelessWidget {
  const OnBoardingActionButtons({
    super.key,
    required this.onBoardingCubit,
  });

  final OnBoardingCubit onBoardingCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 67.w),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () {
              onBoardingCubit.skip(context);
            },
            child: Text(
              'Skip',
              style: AppTextStyles.cairoBlack(16, FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        CustomButton(
          width: 165.w,
          buttonText: 'Follow up',
          buttonAction: () {
            onBoardingCubit.increaseIndex();
          },
          buttonStyle: AppTextStyles.cairoWhite(16, FontWeight.bold),
        ),
      ],
    );
  }
}
