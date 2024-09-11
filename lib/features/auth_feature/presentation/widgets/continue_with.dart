import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            'Or continue with',
            style: AppTextStyles.cairoBlack(16, FontWeight.w500),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
