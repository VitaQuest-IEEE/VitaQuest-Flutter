import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthContainer extends StatelessWidget {
  final Widget widget;
  const AuthContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(138.r),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1.5,
              blurRadius: 16.r,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: widget,
      ),
    );
  }
}
