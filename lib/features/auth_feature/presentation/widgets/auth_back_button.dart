import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/navigation_helper.dart';

class AuthBackButton extends StatelessWidget {
  final String page;
  const AuthBackButton({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: page == 'login' ? 64.h : 24.h, left: 24.w),
      child: IconButton(
        onPressed: () {
          goBack(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 32.r,
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
    );
  }
}
