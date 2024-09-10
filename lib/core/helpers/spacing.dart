import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacingExtension on num {
  SizedBox get setVerticalSpace => SizedBox(height: this.h);
  SizedBox get setHorizontalSpace => SizedBox(width: this.w);
}