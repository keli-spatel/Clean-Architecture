import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Common/SnackBar/show_snack_bar.dart';
import '../Bloc/Category_product/Category_product_Bloc.dart';
import '../Bloc/Category_product/Category_product_State.dart';

class RightSideCategory extends StatelessWidget {
  const RightSideCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryProductBloc, CategoryProductState>(
      listener: (context, categoryProductState) {
        if (categoryProductState is CategoryProductErrorState) {
          customSnackBar(
            context: context,
            text: categoryProductState.errorMessage,
            icon: Icons.error,
            bgColor: Colors.red,
          );
        }
      },
      builder: (context, categoryProductState) {
        if (categoryProductState is CategoryProductLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (categoryProductState is CategoryProductLoadedState) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 15.h),
            height: double.infinity,
            width: 260.w,
            child: ListView.builder(
              itemCount: categoryProductState.categoryProduct.length,
              itemBuilder: (context, index) {
                final product = categoryProductState.categoryProduct[index];
                return Card(
                  child: Column(
                    children: [
                      Text("${product.productName}"),
                      Text("${product.price}"),
                      Text("${product.description}"),
                    ],
                  ),
                );
              },),
          );
        } else {
          return const Center(
            child: Text("SomeThing Went Wrong"),
          );
        }
      },
    );
  }
}
