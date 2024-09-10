import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vita_quest/core/helpers/spacing.dart';
import 'package:vita_quest/features/introduction/presentation/widgets/registration_buttons.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../presentation_logic_holder/on_boarding_cubit.dart';

class ImageWithDescription extends StatelessWidget {
  final String description, image;
  const ImageWithDescription({
    super.key,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Column(
          children: [
            Image.asset(
              image,
              height: 312.h,
              width: 312.w,
            ),
            80.setVerticalSpace,
            BlocProvider.of<OnBoardingCubit>(context).index == 4
                ? const RegistrationButtons()
                : Text(
                    description,
                    style: AppTextStyles.cairoBlack(
                      16,
                      FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ],
        );
      },
    );
  }
}
