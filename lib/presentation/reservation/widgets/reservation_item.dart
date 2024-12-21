import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madmon_task/presentation/reservation/model/reservation_item_action_btn_model.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manger.dart';
import '../../../core/shared_components/custom_button.dart';
import '../../../core/shared_components/custom_divider.dart';
import '../../../core/shared_components/date_widget.dart';
import '../../../core/shared_components/person_info.dart';
import '../../../core/shared_components/price_widget.dart';

class ReservationItem extends StatefulWidget {
  final ReservationItemActionBtnModel btn;
  const ReservationItem({
    super.key,
    required this.btn,
  });

  @override
  State<ReservationItem> createState() => _ReservationItemState();
}

class _ReservationItemState extends State<ReservationItem> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: ColorManager.greyColor2),
          color: Colors.white),
      child: ExpandableNotifier(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#131256765444444",
                      style: StylesManger.medium.copyWith(
                          fontSize: 12.sp, color: ColorManager.hintColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          height: 12.h,
                          width: 11.w,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Fifth Settlement ",
                          style: StylesManger.medium.copyWith(
                              fontSize: 12.sp, color: ColorManager.hintColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 40.w,
                ),
                Expanded(
                  child: CustomButtton(
                      btnName: widget.btn.title,
                      titleColor: widget.btn.titleColor,
                      borderColor: widget.btn.borderColor,
                      btnColor: widget.btn.btnColor),
                )
              ],
            ),
            const CustomDivider(),
            const PersonInfo(
                title: "Seller Info",
                name: "Abd El-Rahman Ahmed",
                contact: "01122874620"),
            Expandable(
              collapsed: Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: ExpandableButton(
                    child: SvgPicture.asset('assets/icons/more.svg'),
                  ),
                ),
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomDivider(),
                  const PersonInfo(
                      title: "Buyer Info",
                      name: "Abd El-Rahman Ahmed",
                      contact: "01122874620"),
                  const CustomDivider(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PriceWidget(title: "Unit Price", ammount: "150.000.000"),
                      PriceWidget(title: "Commission", ammount: "150.000.000"),
                    ],
                  ),
                  const CustomDivider(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateWidget(title: "Date Reserved", date: "20/3/2024"),
                      DateWidget(title: "Last Action", date: "20/3/2024"),
                    ],
                  ),
                  const CustomDivider(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/edit.svg',
                        height: 12.h,
                        width: 11.w,
                        color: ColorManager.primaryColor,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "See Notes",
                        style: StylesManger.medium.copyWith(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const CustomDivider(),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: ExpandableButton(
                      child: SvgPicture.asset(
                        'assets/icons/less.svg',
                        color: ColorManager.hintColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
