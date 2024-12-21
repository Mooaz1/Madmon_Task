import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon_task/core/resources/color_manager.dart';

import '../resources/styles_manger.dart';

class PriceWidget extends StatelessWidget {
  final String title;
  final String ammount;
  const PriceWidget({
    super.key,
    required this.title,
    required this.ammount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StylesManger.medium.copyWith(
              fontSize: 12.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          ammount,
          style: StylesManger.medium.copyWith(
              fontSize: 14.sp,
              color: ColorManager.redColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
