import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Core/Common/Sized_Box/Sized_Box.dart';
import 'package:e_commerce_app/Core/Common/SnackBar/show_snack_bar.dart';
import 'package:e_commerce_app/Features/Categories/Presentation/Bloc/Category_product/Category_product_Event.dart';
import 'package:e_commerce_app/Features/Categories/Presentation/Widget/category_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc/Category_product/Category_product_Bloc.dart';

class LeftSideCategory extends StatelessWidget {
  const LeftSideCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h),
      height: double.infinity,
      width: 95.w,
      decoration: const BoxDecoration(
        color: CustomColor.veryLightGreen,
      ),
      child: ListView.builder(
        itemCount: CategoriesData.categoryImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              BlocProvider.of<CategoryProductBloc>(context).add(
                GetCategoryProductEvent(
                  categoryProductName: CategoriesData.categoryImages[index]
                      ['title']!,
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: CustomColor.veryLightGreen),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70.r),
                    child: Image.network(
                      CategoriesData.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 50.h,
                      width: 50.w,
                    ),
                  ),
                ),
                gapHeight(3),
                Text(
                  "${CategoriesData.categoryImages[index]['title']}",
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
                gapHeight(5),
                Container(
                  height: 0.2.h,
                  width: 63.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                gapHeight(10)
              ],
            ),
          );
        },
      ),
    );
  }
}
