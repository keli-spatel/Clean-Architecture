import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Color/Colors.dart';

Widget customButton({
  required VoidCallback onTap,
  required String btnText,
  Color btnColor = CustomColor.darkGreen,
  Color btnTextColor = Colors.white,
  num btnWidth = 280,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 42.h,
      width: btnWidth.w,
      decoration: BoxDecoration(
        color: btnColor,
        border: Border.all(
          color: CustomColor.darkGreen,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(7.r),
        ),
      ),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(
            color: btnTextColor,
          ),
        ),
      ),
    ),
  );
}
