import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/styles_manger.dart';

class CustomButtton extends StatelessWidget {
  final String btnName;
  final Color titleColor;
  final Color btnColor;
  final Color borderColor;
  const CustomButtton({
    super.key,
    required this.btnName,
    required this.btnColor,
    required this.titleColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5.r),
            color: btnColor),
        child: Center(
          child: Text(
            btnName,
            style: StylesManger.medium
                .copyWith(fontSize: 10.sp, color: titleColor),
          ),
        ),
      ),
    );
  }
}
