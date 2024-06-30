import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_product/Search_product_Bloc.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_product/Search_product_State.dart';
import 'package:e_commerce_app/Features/Search/presentation/Widget/search_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Common/SnackBar/show_snack_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: CustomColor.darkGreen,
            flexibleSpace: Container(
              decoration: const BoxDecoration(color: Colors.white),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(8.h),
              child: const SearchAppBarWidget(),
            ),
          ),
          body: BlocConsumer<SearchProductBloc, SearchProductState>(
            listener: (context, searchProductState) {
              if (searchProductState is SearchProductErrorState) {
                customSnackBar(
                  context: context,
                  text: searchProductState.errorMessage,
                  icon: Icons.error,
                  bgColor: Colors.red,
                );
              }
            },
            builder: (context, searchProductState) {
              if (searchProductState is SearchProductLoadingState) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (searchProductState is SearchProductLoadedState) {
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 15.h),
                  height: double.infinity,
                  width: 260.w,
                  child: ListView.builder(
                    itemCount: searchProductState.searchProduct.length,
                    itemBuilder: (context, index) {
                      final product = searchProductState.searchProduct[index];
                      return Card(
                        child: Column(
                          children: [
                            Text("${product.productName}"),
                            Text("${product.price}"),
                            Text("${product.description}"),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text("SomeThing Went Wrong"),
                );
              }
            },
          )),
    );
  }
}


// BlocConsumer<SearchProductBloc, SearchProductState>(
// listener: (context, searchProductState) {
// if (searchProductState is SearchProductErrorState) {
// customSnackBar(
// context: context,
// text: searchProductState.errorMessage,
// icon: Icons.error,
// bgColor: Colors.red,
// );
// }
// },
// builder: (context, searchProductState) {
// if (searchProductState is SearchProductLoadingState) {
// return const Center(
// child: CupertinoActivityIndicator(),
// );
// } else if (searchProductState is SearchProductLoadedState) {
// return Container(
// color: Colors.white,
// padding: EdgeInsets.only(top: 15.h),
// height: double.infinity,
// width: 260.w,
// child: ListView.builder(
// itemCount: searchProductState.searchProduct.length,
// itemBuilder: (context, index) {
// final product = searchProductState.searchProduct[index];
// return Card(
// child: Column(
// children: [
// Text("${product.productName}"),
// Text("${product.price}"),
// Text("${product.description}"),
// ],
// ),
// );
// },
// ),
// );
// } else {
// return const Center(
// child: Text("SomeThing Went Wrong"),
// );
// }
// },
// )),