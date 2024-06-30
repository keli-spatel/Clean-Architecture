import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Color/Colors.dart';
import '../../../../Core/Common/Sized_Box/Sized_Box.dart';

class SubServiceWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String titleText;
  final String? subTitleText;
  final IconData icon;
  final Color bgColor;

  const SubServiceWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.titleText,
    this.subTitleText,
    this.bgColor = CustomColor.veryLightGreen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w),
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 2, // Blur radius
              offset: const Offset(1, 1), // changes the direction of the shadow
            ),
          ],
          color: bgColor,
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Row(
          children: [
            gapWidth(20),
            Icon(icon, color: CustomColor.darkGreen, size: 22.sp),
            gapWidth(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$titleText",
                  style: TextStyle(
                    color: CustomColor.darkGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapHeight(1),
                Text(
                  "$subTitleText",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}