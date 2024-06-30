import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Core/Common/Button/Button.dart';
import 'package:e_commerce_app/Core/Common/Sized_Box/Sized_Box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0.h,
              right: 0.w,
              left: 0.w,
              child: Container(
                height: 336.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColor.darkGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      gapHeight(67),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "RADHE\nCOPER",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "CopperPlateGothic",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 211.h,
              left: 20.w,
              right: 20.w,
              bottom: 100.h,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.r,
                    ),
                  ],
                  color: CustomColor.veryLightGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "   Welcome ..",
                      style: TextStyle(
                        color: CustomColor.darkGreen,
                        fontSize: 20.sp,
                        fontFamily: "CopperPlateGothic",
                      ),
                    ),
                    gapHeight(7.5),
                    Text(
                      "Discover Amazing Things Near Around You",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 13.sp,
                      ),
                    ),
                    gapHeight(40),
                    customButton(
                      onTap: () {
                        Navigator.pushNamed(context, "/SignInPage");
                      },
                      btnText: "Sign In",
                    ),
                    gapHeight(10),
                    customButton(
                      onTap: () {
                        Navigator.pushNamed(context, "/SignUpPage");
                      },
                      btnText: "Sign Up",
                      btnColor: CustomColor.veryLightGreen,
                      btnTextColor: CustomColor.darkGreen,
                    ),
                    gapHeight(34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.w,
                          height: 0.4.h,
                          color: Colors.grey,
                        ),
                        Text(
                          "  Or connect using  ",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12.sp,
                          ),
                        ),
                        Container(
                          width: 50.w,
                          height: 0.4.h,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    gapHeight(28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logo/facebook.png",
                          height: 35.h,
                        ),
                        gapWidth(25),
                        Image.asset(
                          "assets/logo/google.png",
                          height: 35.h,
                        ),
                        gapWidth(25),
                        Image.asset(
                          "assets/logo/phone.png",
                          height: 35.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// GestureDetector(
// onTap: () {
// Navigator.pushNamed(context, "/SignUpPage");
// },
// child: Container(
// height: 24.h,
// width: 280.w,
// decoration: BoxDecoration(
// color: CustomColor.veryLightGreen,
// border: Border.all(
// color: CustomColor.darkGreen,
// ),
// borderRadius: BorderRadius.all(
// Radius.circular(7.r),
// ),
// ),
// child: const Center(
// child: Text(
// "Sign Up",
// style: TextStyle(
// color: CustomColor.darkGreen,
// ),
// )),
// ),
// ),

//------

// GestureDetector(
// onTap: () {
// Navigator.pushNamed(context, "/SignInPage");
// },
// child: Container(
// height: 24.h,
// width: 280.w,
// decoration: BoxDecoration(
// color: CustomColor.darkGreen,
// borderRadius: BorderRadius.all(
// Radius.circular(7.r),
// ),
// ),
// child: const Center(
// child: Text(
// "Sign In",
// style: TextStyle(
// color: Colors.white,
// ),
// )),
// ),
// ),
