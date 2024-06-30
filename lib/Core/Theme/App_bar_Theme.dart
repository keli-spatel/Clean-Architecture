import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Color/Colors.dart';

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      color: CustomColor.darkGreen,
      fontFamily: "CopperPlateGothic",
      fontSize: 18.sp,
    ),
  );
}
