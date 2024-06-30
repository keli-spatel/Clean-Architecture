import 'package:e_commerce_app/Core/Common/Button/Button.dart';
import 'package:e_commerce_app/Core/Common/Sized_Box/Sized_Box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Color/Colors.dart';
import '../../../../Core/Common/SnackBar/show_snack_bar.dart';
import '../../../../Core/Common/Text_Form_Field/text_form_field.dart';
import '../Bloc/Auth/Auth_Bloc.dart';
import '../Bloc/Auth/Auth_Event.dart';
import '../Bloc/Auth/Auth_State.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is AuthErrorState) {
          customSnackBar(
            context: context,
            text: authState.authError,
            icon: Icons.error,
            bgColor: Colors.red,
          );
        }
        if (authState is AuthLoadedState) {
          customSnackBar(
            context: context,
            text: "Successfully Register",
            icon: Icons.check_circle_rounded,
            bgColor: Colors.green,
          );
          // Navigator.pushReplacementNamed(context, "/HomeBottomNavigationBarPage");
          // Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false)
          Navigator.pushNamedAndRemoveUntil(
              context, "/HomeBottomNavigationBarPage", (route) => false);
        }
      },
      builder: (context, authState) {
        // SystemChrome.setSystemUIOverlayStyle(
        //   SystemUiOverlayStyle.light.copyWith(
        //     systemNavigationBarIconBrightness: Brightness.dark,
        //     systemNavigationBarColor: Colors.white,
        //     statusBarIconBrightness: Brightness.dark,<
        //     statusBarColor: Colors.white, // Note RED here
        //   ),
        // );
        return SafeArea(
          child: Scaffold(
            body: authState is AuthLoadingState
                ? const Center(child: CupertinoActivityIndicator())
                : SafeArea(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0.h,
                          right: 0.w,
                          left: 0.w,
                          child: Container(
                            height: 249.h,
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
                                  gapHeight(17),
                                  Row(
                                    children: [
                                      gapWidth(199),
                                      Container(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          padding: EdgeInsets.all(9.h),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                          ),
                                          child: const Text(
                                            "RADHE  COPER",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "CopperPlateGothic",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 86.h,
                          right: 2.w,
                          left: 15.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.sp,
                                  fontFamily: 'CopperPlateGothic',
                                ),
                              ),
                              gapHeight(3),
                              Text(
                                " Sign Up To Discover Amazing Things Near\n Around You..",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 186.h,
                          left: 20.w,
                          right: 20.w,
                          // bottom: 35.h,
                          child: Container(
                            height: 440.h,
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
                            child: Form(
                              key: _signUpFormKey,
                              child: Column(
                                children: [
                                  gapHeight(26.8),
                                  // Change Container to Sized Box
                                  SizedBox(
                                    // height: 30.h,
                                    width: 280.w,
                                    child: customTextFormField(
                                      inputType: TextInputType.name,
                                      obscureText: false,
                                      controller: _nameController,
                                      prefixIconName: Icons.person_pin_rounded,
                                      hintText: "Name",
                                    ),
                                  ),
                                  gapHeight(9.6),
                                  // Change Container to Sized Box
                                  SizedBox(
                                    // height: 30.h,
                                    width: 280.w,
                                    child: customTextFormField(
                                      inputType: TextInputType.emailAddress,
                                      obscureText: false,
                                      controller: _emailController,
                                      prefixIconName: Icons.email,
                                      hintText: "Email",
                                    ),
                                  ),
                                  gapHeight(9.6),
                                  // Change Container To Sized Box
                                  SizedBox(
                                    // height: 30.h,
                                    width: 280.w,
                                    child: customTextFormField(
                                      inputType: TextInputType.name,
                                      obscureText: true,
                                      controller: _passwordController,
                                      prefixIconName: Icons.lock,
                                      hintText: "Password",
                                    ),
                                  ),
                                  gapHeight(19),
                                  customButton(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      BlocProvider.of<AuthBloc>(context).add(
                                        SignUpUserEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          name: _nameController.text,
                                        ),
                                      );
                                      // _signUpData();
                                      // showSnackBar(context, "User Register SuccessFully");
                                    },
                                    btnText: "Sign Up",
                                  ),
                                  gapHeight(5.7),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Already Have An Account ?",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13.sp,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacementNamed(
                                                  context, "/SignInPage");
                                            },
                                            child: Text(
                                              "Sign In",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: "Nexa",
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                              gapHeight(19),
                                              Row(

                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                            ],
                                          ),
                                          gapHeight(28.5),
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
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
