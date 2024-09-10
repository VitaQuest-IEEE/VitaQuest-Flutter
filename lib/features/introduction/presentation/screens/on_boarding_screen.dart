import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vita_quest/core/helpers/app_images.dart';

import '../presentation_logic_holder/on_boarding_cubit.dart';
import '../widgets/image_with_description.dart';
import '../widgets/page_indicator_with_buttons.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> descriptions = [
      'Provide explanations and management advice for vitamin deficiency symptoms.',
      'Provide personalized suggestions for vitamin-rich foods.',
      'Monitor vital signs such as body temperature, pulse, and blood pressure using a smart bracelet.',
      'Detect vitamin deficiencies using AI from images and surveys.',
      '',
    ];
    List<String> images = [
      Assets.imagesOnBoardingOnBoarding1,
      Assets.imagesOnBoardingOnBoarding2,
      Assets.imagesOnBoardingOnBoarding3,
      Assets.imagesOnBoardingOnBoarding4,
      Assets.imagesOnBoardingOnBoarding5,
    ];
    var onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
          child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 80.h,
                    child: AnimatedSwitcher(
                      switchInCurve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: ImageWithDescription(
                        description: descriptions[onBoardingCubit.index],
                        image: images[onBoardingCubit.index],
                        key: ValueKey(onBoardingCubit.index),
                      ),
                    ),
                  ),
                  const PageIndicatorWithButtons(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
