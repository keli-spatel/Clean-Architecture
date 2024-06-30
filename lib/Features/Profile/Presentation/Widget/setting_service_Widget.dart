import 'package:e_commerce_app/Features/Profile/Presentation/Bloc/Service_visibility/Service_visibility_Bloc.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Widget/sub_service_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Color/Colors.dart';
import '../../../../Core/Common/Sized_Box/Sized_Box.dart';
import '../Bloc/Service_visibility/Service_visibility_Event.dart';
import '../Bloc/Service_visibility/Service_visibilityz_State.dart';

class SettingServiceWidget extends StatelessWidget {
  const SettingServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<ServiceVisibilityBloc>(context)
                .add(TriggerListVisibility());
          },
          child: Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 2, // Blur radius
                  offset:
                      const Offset(1, 1), // changes the direction of the shadow
                ),
              ],
              color: CustomColor.veryLightGreen,
              borderRadius: BorderRadius.circular(7.r),
            ),
            child: Row(
              children: [
                gapWidth(20),
                Icon(Icons.electrical_services_sharp,
                    color: CustomColor.darkGreen, size: 24.sp),
                gapWidth(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Services",
                      style: TextStyle(
                        color: CustomColor.darkGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    gapHeight(1),
                    Text(
                      "Explore Over Great Services",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                BlocBuilder<ServiceVisibilityBloc, ServiceVisibilityState>(
                  builder: (context, state) {
                    return !state.isVisible ? gapWidth(87.w) : gapWidth(81);
                  },
                ),
                BlocBuilder<ServiceVisibilityBloc, ServiceVisibilityState>(
                  builder: (context, state) {
                    return !state.isVisible
                        ? Icon(
                            Icons.arrow_forward_ios,
                            size: 15.sp,
                          )
                        : Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: CustomColor.darkGreen,
                            size: 27.sp,
                            weight: 0.1.w,
                          );
                  },
                )
              ],
            ),
          ),
        ),
        BlocBuilder<ServiceVisibilityBloc, ServiceVisibilityState>(
          builder: (context, state) {
            return Visibility(
                visible: state.isVisible,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 33.w,
                    top: 4.h,
                  ),
                  child: Column(
                    children: [
                      SubServiceWidget(
                        onTap: () {
                          Navigator.pushNamed(context, "/AboutAsPage");
                        },
                        icon: Icons.abc_outlined,
                        titleText: "About As",
                        subTitleText: "More About As",
                        bgColor: Colors.white,
                      ),
                      gapHeight(3),
                      SubServiceWidget(
                        onTap: () {
                          Navigator.pushNamed(context, "/ContactAsPage");
                        },
                        icon: Icons.mark_email_read,
                        titleText: "Contact As",
                        subTitleText: "Connect With Us For Explore More",
                        bgColor: Colors.white,
                      ),
                      gapHeight(3),
                      SubServiceWidget(
                        onTap: () {
                          Navigator.pushNamed(context, "/PrivacyAndPolicyPage");
                        },
                        icon: Icons.policy,
                        titleText: "Privacy And Policy",
                        subTitleText: "Read App Policy For Better Journey",
                        bgColor: Colors.white,
                      ),
                    ],
                  ),
                ));
          },
        ),
      ],
    );
  }
}
