import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manger.dart';

class PersonInfo extends StatelessWidget {
  final String title;
  final String name;
  final String contact;

  const PersonInfo({
    super.key,
    required this.title,
    required this.name,
    required this.contact,
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
          name,
          style: StylesManger.medium
              .copyWith(fontSize: 12.sp, color: ColorManager.hintColor),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/call.svg',
              height: 12.h,
              width: 11.w,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              contact,
              style: StylesManger.medium
                  .copyWith(fontSize: 12.sp, color: ColorManager.hintColor),
            ),
          ],
        ),
      ],
    );
  }
}
