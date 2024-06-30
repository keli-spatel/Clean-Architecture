import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_product/Search_product_Bloc.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_product/Search_product_Event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Color/Colors.dart';
import '../Bloc/Search_suggestion_product/Search_suggestion_product_Bloc.dart';
import '../Bloc/Search_suggestion_product/Search_suggestion_product_Event.dart';

class SearchAppBarWidget extends StatefulWidget {
  const SearchAppBarWidget({super.key});

  @override
  State<SearchAppBarWidget> createState() => _SearchAppBarWidgetState();
}

class _SearchAppBarWidgetState extends State<SearchAppBarWidget> {

  @override
  Widget build(BuildContext context) {
    // final TextEditingController _searchController = TextEditingController();
    //
    // _searchController.addListener(() {
    //   final searchTerm = _searchController.text;
    //   if (searchTerm.isNotEmpty) {
    //     BlocProvider.of<SearchSuggestionProductBloc>(context)
    //         .add(
    //         GetSearchSuggestionProductEvent(productSuggestedName: searchTerm));
    //   }
    // });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            height: 40.h,
            margin: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Material(
              borderRadius: BorderRadius.circular(7.r),
              elevation: 1,
              child: TextFormField(
                // controller: _searchController,
                onFieldSubmitted: (value) {
                  BlocProvider.of<SearchProductBloc>(context).add(
                    GetSearchProductEvent(productName: value),
                  );
                },
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 6,
                      ),
                      child: Icon(
                        Icons.search,
                        color: CustomColor.darkGreen,
                        size: 23,
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(top: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.r),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.r),
                    ),
                    borderSide: BorderSide(
                      color: CustomColor.darkGreen,
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.r),
                    ),
                    borderSide: BorderSide(
                      color: CustomColor.darkGreen,
                      width: 1.w,
                    ),
                  ),
                  hintText: ' Search',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: CustomColor.darkGreen,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Voice search
        // Container(
        //   height: 39.h,
        //   margin: EdgeInsets.only(left: 12.w,right: 3.w,),
        //   padding: EdgeInsets.only(right: 8.w,left:8.w),
        //   decoration: BoxDecoration(
        //     color: Colors.transparent,
        //     borderRadius: BorderRadius.circular(7.0.r),
        //     border: Border.all(color: CustomColor.darkGreen)
        //   ),
        //   // margin: EdgeInsets.symmetric(horizontal: 10.w),
        //   child: const Icon(Icons.mic, color: CustomColor.darkGreen, size: 24),
        // ),
        // gapWidth(10),
      ],
    );
  }
}
