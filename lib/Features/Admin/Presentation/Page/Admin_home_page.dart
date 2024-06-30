import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Get-Product/Get_product_Event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Common/Button/AppBar_icon_Button.dart';
import '../Bloc/Get-Product/Get_product_Bloc.dart';
import '../Bloc/Get-Product/Get_product_State.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProductBloc>(context).add(GetProductEvent());
  }

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
        appBar: AppBar(
          leading: appBarIconButton(context),
          title: const Text("Admin"),
        ),
        body: BlocConsumer<GetProductBloc, GetProductState>(
          listener: (context, getProductState) {
            // TODO: implement listener
          },
          builder: (context, getProductState) {
            if (getProductState is GetProductLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (getProductState is GetProductLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<GetProductBloc>(context).add(GetProductEvent());
                },
                child: ListView.builder(
                  itemCount: getProductState.productList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Text("${getProductState.productList[index].productName}"),
                            Text("${getProductState.productList[index].description}"),
                            Text("${getProductState.productList[index].quantity}"),
                            Text("\₹ ${getProductState.productList[index].price}"),
                          ],
                        ),
                      );
                    },
                ),
              );
            } else {
              return Center(child: Text("SomeThing Went Wrong"));
            }
            // return getProductState is GetProductLoadedState
            //     ? const Center(child: CupertinoActivityIndicator())
            //     : ListView.builder(
            //   itemCount: getProductState.pro,
            //     itemBuilder: itemBuilder
            // );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: CustomColor.darkGreen,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30.r), // Adjust the border radius as needed
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/AddAdminProductPage");
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
