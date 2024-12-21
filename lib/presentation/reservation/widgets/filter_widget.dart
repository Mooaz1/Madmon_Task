import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manger.dart';
import '../../../core/shared_components/custom_check_box.dart';
import '../cubit/reservation_cubit.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    super.key,
    required this.cubit,
  });

  final ReservationCubit cubit;

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  RangeValues _currentRangeValues = const RangeValues(1, 8);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 24.w),
              child: Text(
                "Filter by:",
                style: StylesManger.medium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primaryColor),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ExpandablePanel(
                theme: const ExpandableThemeData(
                  hasIcon: false, // Disable default icon to manage it manually
                ),
                header: Container(
                  color: const Color(0xffF8F8F8),
                  padding: EdgeInsetsDirectional.only(start: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status',
                          style: StylesManger.regular
                              .copyWith(color: Colors.black)),
                      ExpandableIcon(
                        // Add the icon manually
                        theme: const ExpandableThemeData(
                          expandIcon: Icons.keyboard_arrow_down,
                          collapseIcon: Icons.keyboard_arrow_up,
                          iconColor: Colors.black,
                          iconSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: const SizedBox(),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<ReservationCubit, ReservationState>(
                      builder: (context, state) {
                        return CustomCheckBox(
                          title: "Reserved",
                          value: widget.cubit.isFilterReserved,
                          onChanged: (value) {
                            widget.cubit.changeIsFilterReserved(value!);
                          },
                        );
                      },
                    ),
                    BlocBuilder<ReservationCubit, ReservationState>(
                      builder: (context, state) {
                        return CustomCheckBox(
                          title: "Not Reserved",
                          value: widget.cubit.isFilterNotReserved,
                          onChanged: (value) {
                            widget.cubit.changeIsNotFilterReserved(value!);
                          },
                        );
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 16.h,
            ),
            ExpandablePanel(
                theme: const ExpandableThemeData(
                  hasIcon: false, // Disable default icon to manage it manually
                ),
                header: Container(
                  color: const Color(0xffF8F8F8),
                  padding: EdgeInsetsDirectional.only(start: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Location',
                          style: StylesManger.regular
                              .copyWith(color: Colors.black)),
                      ExpandableIcon(
                        // Add the icon manually
                        theme: const ExpandableThemeData(
                          expandIcon: Icons.keyboard_arrow_down,
                          collapseIcon: Icons.keyboard_arrow_up,
                          iconColor: Colors.black,
                          iconSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: const SizedBox(),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<ReservationCubit, ReservationState>(
                      builder: (context, state) {
                        return CustomCheckBox(
                          title: "El Sheikh Zayed",
                          value: widget.cubit.isZayed,
                          onChanged: (value) {
                            widget.cubit.changeIsZayed(value!);
                          },
                        );
                      },
                    ),
                    BlocBuilder<ReservationCubit, ReservationState>(
                      builder: (context, state) {
                        return CustomCheckBox(
                          title: "Fifth Settlement",
                          value: widget.cubit.isFifht,
                          onChanged: (value) {
                            widget.cubit.changeIsFifht(value!);
                          },
                        );
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 16.h,
            ),
            ExpandablePanel(
                theme: const ExpandableThemeData(
                  hasIcon: false, // Disable default icon to manage it manually
                ),
                header: Container(
                  color: const Color(0xffF8F8F8),
                  padding: EdgeInsetsDirectional.only(start: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price',
                          style: StylesManger.regular
                              .copyWith(color: Colors.black)),
                      ExpandableIcon(
                        // Add the icon manually
                        theme: const ExpandableThemeData(
                          expandIcon: Icons.keyboard_arrow_down,
                          collapseIcon: Icons.keyboard_arrow_up,
                          iconColor: Colors.black,
                          iconSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: const SizedBox(),
                expanded: Image.asset('assets/icons/slider.png')),
            SizedBox(
              height: 70.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                padding: EdgeInsets.symmetric(vertical: 9.h),
                decoration: BoxDecoration(
                  color: const Color(0xff6666FF),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    "Show Results",
                    style: StylesManger.medium.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  widget.cubit.clearFilterData();
                  Navigator.pop(context);
                },
                child: Text(
                  "Reset All",
                  style: StylesManger.regular.copyWith(
                      fontSize: 16.sp, decoration: TextDecoration.underline),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            )
          ],
        ),
      ),
    );
  }
}
