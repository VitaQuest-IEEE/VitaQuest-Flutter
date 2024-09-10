import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vita_quest/core/helpers/spacing.dart';
import 'package:vita_quest/core/theme/app_colors.dart';

import 'package:vita_quest/features/introduction/presentation/presentation_logic_holder/on_boarding_cubit.dart';

import 'on_boarding_action_buttons.dart';

class PageIndicatorWithButtons extends StatefulWidget {
  const PageIndicatorWithButtons({super.key});

  @override
  State<PageIndicatorWithButtons> createState() =>
      _PageIndicatorWithButtonsState();
}

class _PageIndicatorWithButtonsState extends State<PageIndicatorWithButtons> {
  @override
  Widget build(BuildContext context) {
    var onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              onBoardingCubit.index == 4
                  ? SizedBox(height: 48.h)
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          onBoardingCubit.decreaseIndex(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 30.r,
                        ),
                      ),
                    ),
              390.setVerticalSpace,
              AnimatedSmoothIndicator(
                activeIndex: onBoardingCubit.index,
                duration: const Duration(milliseconds: 500),
                count: 5,
                effect: JumpingDotEffect(
                  dotColor: AppColors.secondaryGreenColor,
                  activeDotColor: AppColors.mainGreenColor,
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  spacing: 8.w,
                ),
              ),
              160.setVerticalSpace,
              onBoardingCubit.index == 4
                  ? const SizedBox()
                  : OnBoardingActionButtons(onBoardingCubit: onBoardingCubit),
            ],
          ),
        );
      },
    );
  }
}
