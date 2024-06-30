import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Bloc/Bottom_Bar/Bottom_Bar_Event.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Widget/Bottom_navigation_bar_item_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc/Bottom_Bar/Bottom_Bar_Bloc.dart';
import '../Bloc/Bottom_Bar/Bottom_Bar_State.dart';

class HomeBottomNavigationBarPage extends StatelessWidget {
  const HomeBottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white, // Note RED here
      ),
    );
    return SafeArea(
      child: BlocBuilder<BottomBarBloc, BottomBarState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: BottomNavigationBarItemWidget(index: state.index),
              bottomNavigationBar: Container(
                // height: 37.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  color: Colors.grey,
                  border: Border(
                      top: BorderSide(
                    width: 0.2.w,
                    color: CustomColor.darkGreen,
                  )),
                ),
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                    currentIndex: state.index,
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0,
                    onTap: (indexValue) {
                      print(indexValue);
                      BlocProvider.of<BottomBarBloc>(context)
                          .add(TriggerBottomBarIconEvent(index: indexValue));
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: "Home",
                        icon: SizedBox(
                          height: 18.h,
                          width: 18.w,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/home222.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                        activeIcon: SizedBox(
                          height: 18.h,
                          width: 18.w,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/home111.png",
                            color: CustomColor.darkGreen,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Categories",
                        icon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/bag1.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/bag2.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Search",
                        icon: SizedBox(
                          width: 18.w,
                          height: 18.h,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/search11.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/search11.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Cart",
                        icon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/cart1.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/cart2.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Profile",
                        icon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/user321.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            // width: 20.w,
                            // height: 20.h,
                            "assets/icon/user123.png",
                            color: CustomColor.darkGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
