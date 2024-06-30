import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Core/Common/Sized_Box/Sized_Box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Radhe  Copper",style: TextStyle(fontSize: 20.sp,),),
      ),
      body: Center(
        child: Text("Home Page  >"),
      ),
    );
  }
}
