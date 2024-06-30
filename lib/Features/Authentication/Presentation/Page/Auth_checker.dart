import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Home/Presentation/Page/Home_Bottom_Navigation_Page.dart';
import '../Bloc/Auth/Auth_Bloc.dart';
import '../Bloc/Auth/Auth_Event.dart';
import '../Bloc/Auth/Auth_State.dart';
import 'Welcome_Page.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

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
    BlocProvider.of<AuthBloc>(context).add(CheckUserIsLoggedInEvent());
    print("Auth Checker Called"); 
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            print("Main Page Auth Bloc Called");
            if (authState is AuthLoadingState) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (authState is UserLoggedInState) {
              return const HomeBottomNavigationBarPage();
            } else {
              return const WelcomePage();
            }
          },
        ),
      ),
    );
  }
}
