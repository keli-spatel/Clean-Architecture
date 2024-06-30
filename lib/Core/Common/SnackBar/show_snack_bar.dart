import 'package:e_commerce_app/Core/Common/Sized_Box/Sized_Box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customSnackBar({
  required BuildContext context,
  required String text,
  required IconData icon,
  required Color bgColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          gapWidth(6),
          Expanded(child: Text(text)),
        ],
      ),
      backgroundColor: bgColor,
      duration: const Duration(seconds: 3),
      showCloseIcon: false,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20.h),
    ),
  );
}
