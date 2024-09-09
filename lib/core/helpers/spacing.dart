import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacingExtension on num {
  SizedBox get verticalSpace => SizedBox(height: this.h);
  SizedBox get horizontalSpace => SizedBox(width: this.w);
}