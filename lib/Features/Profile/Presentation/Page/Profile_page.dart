import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Core/Common/Sized_Box/Sized_Box.dart';
import 'package:e_commerce_app/Core/Common/SnackBar/show_snack_bar.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Widget/setting_service_Widget.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Widget/setting_single_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc/Profile/Profile_Bloc.dart';
import '../Bloc/Profile/Profile_State.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: 30.h,
                    top: 30.h,
                  ),
                  margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 2, // Blur radius
                        offset: const Offset(
                          1,
                          1,
                        ), // changes the direction of the shadow
                      ),
                    ],
                    color: CustomColor.darkGreen,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Row(
                    children: [
                      gapWidth(15),
                      Container(
                        padding: EdgeInsets.only(
                          top: 6.h,
                          bottom: 6.h,
                          right: 6.w,
                          left: 6.w,
                        ),
                        // Padding around the image
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 47.0.r,
                          backgroundImage: const AssetImage(
                            'assets/images/emoji_profile.jpg',
                          ), // Your profile image asset
                          backgroundColor: Colors.grey[
                              300], // Fallback color if image not available
                        ),
                      ),
                      BlocConsumer<ProfileBloc, ProfileState>(
                        listener: (context, profileState) {
                          if (profileState is ProfileErrorState) {
                            return customSnackBar(
                              context: context,
                              text: profileState.errorMessage,
                              icon: Icons.error,
                              bgColor: Colors.red,
                            );
                          }
                        },
                        builder: (context, profileState) {
                          if (profileState is ProfileLoadingState) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          } else if (profileState
                              is SingleUserDataLoadedState) {
                            return Column(
                              children: [
                                Text(
                                  "${profileState.profileUserEntity.userName}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  "${profileState.profileUserEntity.email}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text("SomeThing Went Wrong"),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                gapHeight(20),
                SettingSingleWidget(
                  onTap: () {
                    Navigator.pushNamed(context, "/MyAccountPage");
                  },
                  subTitleText: 'Change Your Profile Settings',
                  titleText: 'My Account',
                  icon: Icons.account_circle_rounded,
                  width: 85,
                ),
                gapHeight(11),
                SettingSingleWidget(
                  onTap: () {
                    Navigator.pushNamed(context, "/OtherSettingsPage");
                  },
                  subTitleText: 'Other Settings For Better Experience',
                  titleText: 'Other Settings',
                  icon: Icons.settings_sharp,
                  width: 43,
                ),
                gapHeight(11),
                SettingServiceWidget(),
                gapHeight(11),
                SettingSingleWidget(
                  onTap: () {
                    Navigator.pushNamed(context, "/AdminHomePage");
                  },
                  subTitleText: 'Manage Your Business',
                  titleText: 'Admin',
                  icon: Icons.admin_panel_settings,
                  width: 117,
                ),
                gapHeight(11),
                SettingSingleWidget(
                  onTap: () {},
                  subTitleText: 'Log Out From Your Account',
                  titleText: 'Log Out',
                  icon: Icons.logout,
                  width: 91,
                ),
                gapHeight(11),
                SettingSingleWidget(
                  onTap: () {},
                  subTitleText: 'Delete Your Data Permanently',
                  titleText: 'Delete Account',
                  icon: Icons.delete,
                  width: 75,
                ),
                // GestureDetector(
                //   onTap: () {
                //     // print("setting");
                //   },
                //   child: Container(
                //     margin: EdgeInsets.only(left: 18.w,right: 18.w),
                //     padding: EdgeInsets.only(top: 10.h,bottom: 10.h),
                //     decoration: BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(color: Colors.grey,blurRadius: 0.1),
                //       ],
                //       color: CustomColor.veryLightGreen,
                //       borderRadius: BorderRadius.circular(7.r),
                //     ),
                //     child: Row(
                //       children: [
                //         gapWidth(20),
                //         Icon(
                //           Icons.logout,
                //           color: CustomColor.darkGreen,
                //           size: 21.sp
                //         ),
                //         gapWidth(20),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "Log Out",
                //               style: TextStyle(
                //                 color: CustomColor.darkGreen,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             gapHeight(1),
                //             Text(
                //               "Log Out From Your Account",
                //               style: TextStyle(
                //                 color: CustomColor.darkGreen,
                //                 fontSize: 10.sp,
                //               ),
                //             ),
                //           ],
                //         ),
                //         gapWidth(95.w),
                //         Icon(Icons.arrow_forward_ios,size: 15,)
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// body: Stack(
// children: [
// Positioned(
// top: 0.h,
// left: 0.w,
// right: 0.w,
// child: Container(
// height: 130.h,
// width: double.infinity,
// decoration: const BoxDecoration(
// color: CustomColor.darkGreen,
// )),
// ),
// Positioned(
// top: 120.h,
// left: 0.w,
// right: 0.w,
// bottom: 0.h,
// child: Container(
// width: double.infinity,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(20.r),
// topRight: Radius.circular(20.r),
// )),
// )),
// Positioned(
// top: 80.h,
// right: 23.w,
// left: 23.w,
// child: Container(
// height: 80.h,
// decoration: BoxDecoration(
// color: CustomColor.veryLightGreen,
// borderRadius: BorderRadius.all(
// Radius.circular(17.r),
// ),
// boxShadow: [
// BoxShadow(
// blurRadius: 5.r,
// spreadRadius: 1.5.r,
// color: Colors.grey,
// blurStyle: BlurStyle.outer)
// ]),
// child: customButton(
// onTap: () {
// Navigator.pushNamed(context, "/AdminHomePage");
// },
// btnText: "Admin"),
// ),
// ),
// ],
// ),
