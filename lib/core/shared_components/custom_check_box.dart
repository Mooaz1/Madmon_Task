import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/styles_manger.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  const CustomCheckBox({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  side: const BorderSide(color: Color(0xff6666FF))))),
      child: CheckboxListTile(
          visualDensity: VisualDensity.standard,
          secondary: Padding(
            padding: EdgeInsetsDirectional.only(start: 12.w),
            child: Text(
              title,
              style: StylesManger.regular,
            ),
          ),
          value: value,
          activeColor: const Color(0xff6666FF),
          onChanged: onChanged),
    );
  }
}
