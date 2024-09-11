import '../../../../core/helpers/navigation_helper.dart';
import '../../../../core/widgets/custom_button.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController firstFadeAnimationController;
  late Animation<double> firstFadeAnimation;
  late AnimationController secondFadeAnimationController;
  late Animation<double> secondFadeAnimation;
  double textBottomPosition = 0, textTopPosition = 0;
  void myFirstFadeAnimation() {
    firstFadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondFadeAnimationController.forward();
          setState(() {
            textBottomPosition = 440.h;
            textTopPosition = 291.h;
          });
        }
      });
    firstFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: firstFadeAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void mySecondFadeAnimation() {
    secondFadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    secondFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: secondFadeAnimationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
  }

  @override
  void dispose() {
    firstFadeAnimationController.dispose();
    secondFadeAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myFirstFadeAnimation();
    mySecondFadeAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.fastEaseInToSlowEaseOut,
            top: textTopPosition,
            bottom: textBottomPosition,
            left: 128.w,
            right: 128.w,
            child: FadeTransition(
              opacity: firstFadeAnimation,
              child: Center(
                child: Image.asset(
                  Assets.imagesSplashLogo,
                  width: 137.w,
                  height: 120.h,
                ),
              ),
            ),
          ),
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 427.5.h,
            bottom: 372.5.h,
            child: FadeTransition(
              opacity: secondFadeAnimation,
              child: Text(
                'Your app to detect vitamin deficiencies and track your health intelligently.',
                style: AppTextStyles.cairoBlack(16, FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 511.5.h,
            bottom: 290.5.h,
            child: FadeTransition(
              opacity: secondFadeAnimation,
              child: CustomButton(
                buttonText: 'Let’s go',
                buttonAction: () {
                  navigateTo(context, Routes.onBoarding, removeAll: true);
                },
                buttonStyle: AppTextStyles.cairoWhite(16, FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
