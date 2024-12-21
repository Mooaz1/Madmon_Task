import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madmon_task/core/resources/color_manager.dart';
import 'package:madmon_task/core/resources/styles_manger.dart';
import 'package:badges/badges.dart' as badges;
import 'package:madmon_task/presentation/reservation/cubit/reservation_cubit.dart';
import 'package:madmon_task/presentation/reservation/widgets/filter_widget.dart';

import '../widgets/reservation_item.dart';
import '../widgets/sort_widget.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReservationCubit>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1), // Shadow color
                offset: const Offset(4, 4), // Shadow offset (x, y)
                blurRadius: 2, // Shadow blur radius
                spreadRadius: 1, // Shadow spread radius
              ),
            ],
          ),
          child: AppBar(
            leading: Image.asset(
              'assets/icons/menu.png',
              height: 13.h,
              width: 20.5.w,
              color: ColorManager.greyColor1,
            ),
            centerTitle: true,
            title: Text(
              "Reservations",
              style: StylesManger.medium,
            ),
            actions: [
              badges.Badge(
                position: badges.BadgePosition.topStart(start: 3.w),
                badgeStyle: const badges.BadgeStyle(padding: EdgeInsets.all(2)),
                badgeContent: const Text(
                  '0',
                  style: TextStyle(color: Colors.red),
                ),
                child: Icon(
                  Icons.notifications_none_rounded,
                  size: 25.h,
                  color: ColorManager.primaryColor,
                ),
              )
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            // elevation: 70,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
        ),
      ),
      backgroundColor: ColorManager.scaffoldCOlor,
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorManager.greyColor2),
                          borderRadius: BorderRadius.circular(10.r)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorManager.greyColor2),
                          borderRadius: BorderRadius.circular(10.r)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorManager.greyColor2),
                          borderRadius: BorderRadius.circular(10.r)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorManager.greyColor2),
                          borderRadius: BorderRadius.circular(10.r)),
                      hintText: "Search..",
                      hintStyle: StylesManger.regular
                          .copyWith(color: ColorManager.hintColor),
                      suffixIcon: SvgPicture.asset(
                        'assets/icons/search.svg',
                        height: 10.h,
                        width: 10.w,
                        color: ColorManager.hintColor,
                      )),
                )),
                SizedBox(
                  width: 4.w,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SortWidget(cubit: cubit));
                  },
                  child: Container(
                    padding: EdgeInsets.all(13.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: ColorManager.greyColor2,
                        )),
                    child: SvgPicture.asset(
                      'assets/icons/search-normal.svg',
                      height: 18.h,
                      width: 18.w,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => FilterWidget(cubit: cubit));
                  },
                  child: Container(
                    padding: EdgeInsets.all(13.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: ColorManager.greyColor2,
                        )),
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      height: 18.h,
                      width: 18.w,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ReservationItem(btn: cubit.reservationBtns[index]),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 22.h,
                      ),
                  itemCount: cubit.reservationBtns.length),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // Shadow color
              offset: const Offset(-4, -4), // Shadow offset (x, y)
              blurRadius: 2, // Shadow blur radius
              spreadRadius: 1, // Shadow spread radius
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BNBItem(title: "Home", icon: "Home"),
            BNBItem(title: "Leads", icon: "leads"),
            BNBItem(title: "Units", icon: "units"),
            BNBItem(
              title: "Reservations",
              icon: "reservations",
              isReservation: true,
            ),
            BNBItem(title: "Account", icon: "account")
          ],
        ),
      ),
    );
  }
}

class BNBItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isReservation;
  const BNBItem(
      {super.key,
      required this.title,
      required this.icon,
      this.isReservation = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/$icon.svg'),
          Text(
            title,
            style: StylesManger.regular.copyWith(
                fontSize: 10.sp,
                color: isReservation
                    ? ColorManager.primaryColor
                    : ColorManager.hintColor),
          )
        ],
      ),
    );
  }
}
