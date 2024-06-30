import 'package:e_commerce_app/Features/Admin/Presentation/Page/Add_admin_product_page.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Page/Admin_home_page.dart';
import 'package:e_commerce_app/Features/Authentication/Presentation/Page/Welcome_Page.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Page/About_as_page.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Page/Contact_as_page.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Page/My_account_page.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Page/Other_Setting_page.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Page/Privacy_and_policy_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Features/Authentication/Presentation/Page/SignIn_Page.dart';
import '../../Features/Authentication/Presentation/Page/SignUp_Page.dart';
import '../../Features/Home/Presentation/Page/Home_Bottom_Navigation_Page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case "/WelcomePage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const WelcomePage(),
      );

    case "/SignUpPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpPage(),
      );

    case "/SignInPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInPage(),
      );

    case "/HomeBottomNavigationBarPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeBottomNavigationBarPage(),
      );

    case "/AddAdminProductPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const AddAdminProductPage(),
      );

    case "/AdminHomePage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const AdminHomePage(),
      );

    case "/MyAccountPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const MyAccountPage(),
      );

    case "/OtherSettingsPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const OtherSettingsPage(),
      );

    case "/AboutAsPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const AboutAsPage(),
      );

    case "/ContactAsPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const ContactAsPage(),
      );

    case "/PrivacyAndPolicyPage":
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (_) => const PrivacyAndPolicyPage(),
      );

    default:
      return CupertinoPageRoute(
        builder: (_) => const Scaffold(
            body: Center(
          child: Text("Screen Dose Not Exist !"),
        )),
      );
  }
}


