import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget gapHeight(num gapHeight) {
  return SizedBox(
    height: gapHeight.h,
  );
}

Widget gapWidth(num gapWidth) {
  return SizedBox(
    width: gapWidth.w,
  );
}
