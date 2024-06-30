import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextFormField({
  required TextInputType inputType,
  required bool obscureText,
  required TextEditingController controller,
  IconData? prefixIconName,
  required String hintText,
  int maxLine = 1,
}) {
  return TextFormField(
    obscureText: obscureText,
    keyboardType: inputType,
    controller: controller,
    maxLines: maxLine,
    decoration: InputDecoration(
      prefixIcon: Icon(
        prefixIconName,
        color: CustomColor.darkGreen,
      ),
      hintStyle: const TextStyle(
        color: Colors.black38,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        borderSide: const BorderSide(
          color: Colors.black12,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
    ),
  );
}


Widget customTextFormFieldWithoutIcon({
  required TextInputType inputType,
  required bool obscureText,
  required TextEditingController controller,
  // IconData? prefixIconName,
  required String hintText,
  int maxLine = 1,
}) {
  return TextFormField(
    obscureText: obscureText,
    keyboardType: inputType,
    controller: controller,
    maxLines: maxLine,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: 17.w,top: 17.h,bottom: 17.h),
      // prefixIcon: Icon(
      //   prefixIconName,
      //   color: CustomColor.darkGreen,
      // ),
      hintStyle: const TextStyle(
        color: Colors.black38,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
        borderSide: const BorderSide(
          color: Colors.black12,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
    ),
  );
}
