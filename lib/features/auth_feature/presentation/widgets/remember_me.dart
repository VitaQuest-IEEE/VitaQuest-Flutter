import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({
    super.key,
  });

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(left: 8.w, right: 1.w),
            constraints: BoxConstraints.tight(
              Size.square(18.r),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              border: Border.all(color: AppColors.mainGreenColor),
              color: _isChecked
                  ? AppColors.mainGreenColor
                  : AppColors.mainWhiteColor,
            ),
            child: _isChecked
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16.r,
                  )
                : null,
          ),
          8.setHorizontalSpace,
          Text(
            'Remember me',
            style: AppTextStyles.cairoBlack(14, FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
