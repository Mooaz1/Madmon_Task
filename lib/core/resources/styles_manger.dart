import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madmon_task/core/resources/color_manager.dart';

class StylesManger {
  static TextStyle medium = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: ColorManager.greyColor1);
  static TextStyle regular = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: ColorManager.greyColor1);
}
