import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Core/Common/Sized_Box/Sized_Box.dart';
import 'package:e_commerce_app/Core/Common/Text_Form_Field/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget addProductTextFormField({
  required String text,
  required TextInputType inputType,
  required bool obscureText,
  required TextEditingController controller,
  required String hintText,
  int maxLine = 1,
}) {
  return Column(
    // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Row(
      children: [
        Text(text,style: const TextStyle(fontWeight: FontWeight.bold),),
        Text("*",style: TextStyle(color: Colors.red,fontSize: 18.sp,),)
      ],
    ),
    // gapHeight(1),
    customTextFormFieldWithoutIcon(
      inputType: inputType,
      obscureText: obscureText,
      controller: controller,
      hintText: hintText,
      maxLine: maxLine,
    ),
  ]);
}
