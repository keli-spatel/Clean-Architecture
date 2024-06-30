import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Core/Theme/App_bar_Theme.dart';
import 'package:e_commerce_app/Core/Theme/Text_Theme.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Add-Product/Admin_product_Bloc.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Get-Product/Get_product_Event.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Pick-Image/Pick_image_Bloc.dart';
import 'package:e_commerce_app/Features/Authentication/Presentation/Bloc/Auth/Auth_Bloc.dart';
import 'package:e_commerce_app/Features/Authentication/Presentation/Page/Auth_checker.dart';
import 'package:e_commerce_app/Features/Categories/Presentation/Bloc/Category_product/Category_product_Bloc.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Bloc/Profile/Profile_Bloc.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Bloc/Profile/Profile_Event.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Bloc/Service_visibility/Service_visibility_Bloc.dart';
import 'package:e_commerce_app/Features/Search/presentation/Bloc/Search_product/Search_product_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/Routes/Routes.dart';
import 'Features/Admin/Presentation/Bloc/Get-Product/Get_product_Bloc.dart';
import 'Features/Home/Presentation/Bloc/Bottom_Bar/Bottom_Bar_Bloc.dart';
import 'Features/Search/presentation/Bloc/Search_suggestion_product/Search_suggestion_product_Bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Auth
        BlocProvider(
          create: (context) => di.sl<AuthBloc>(),
        ),

        // Home
        BlocProvider(
          create: (context) => di.sl<BottomBarBloc>(),
        ),

        // Profile
        BlocProvider(
          create: (context) => di.sl<ServiceVisibilityBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              di.sl<ProfileBloc>()..add(GetSingleUserDataEvent()),
        ),

        // Search
        BlocProvider(
          create: (context) => di.sl<SearchProductBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SearchSuggestionProductBloc>(),
        ),

        // Category
        BlocProvider(
          create: (context) => di.sl<CategoryProductBloc>(),
        ),

        // Admin
        BlocProvider(
          create: (context) => di.sl<AdminProductBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ImagePickerBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetProductBloc>()..add(GetProductEvent()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => generateRoute(settings),
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            brightness: Brightness.light,
            fontFamily: "CopperPlateGothic",
            appBarTheme: appBarTheme(),
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.darkGreen),
            textTheme: textTheme(),
          ),
          home: const AuthChecker(),
        ),
      ),
    );
  }
}

// height  .h
// width    .w
// radius   .r
// fontSize  .sp
// home: BlocBuilder<AuthBloc, AuthState>(
//   builder: (context, authState) {
//     print("Main Page Auth Bloc Called");
//     // BlocProvider.of<AuthBloc>(context)
//     //     .add(CheckUserIsLoggedInEvent());
//     return authState is UserLoggedInState
//         ? const HomeBottomNavigationBarPage()
//         : const WelcomePage();
//   },
// ),
