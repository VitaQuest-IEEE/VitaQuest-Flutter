import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
    required this.buttonStyle,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    this.borderColor,
    this.elevation,
  });
  factory CustomButton.notFilled({
    required String buttonText,
    required Function() buttonAction,
    required TextStyle buttonStyle,
    required Color borderColor,
    double? height,
    double? width,
    double? elevation,
    double? borderRadius,
  }) {
    return CustomButton(
      buttonAction: buttonAction,
      buttonText: buttonText,
      buttonStyle: buttonStyle,
      height: height,
      width: width,
      borderRadius: borderRadius,
      color: Colors.white,
      borderColor: borderColor,
      elevation: elevation,
    );
  }
  final String buttonText;
  final TextStyle buttonStyle;
  final Function() buttonAction;
  final double? height;
  final double? width;
  final double? elevation;
  final double? borderRadius;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: MaterialButton(
        elevation: elevation ?? 4.0,
        onPressed: buttonAction,
        padding: EdgeInsets.zero,
        color: color ?? AppColors.mainGreenColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: buttonStyle,
          ),
        ),
      ),
    );
  }
}
