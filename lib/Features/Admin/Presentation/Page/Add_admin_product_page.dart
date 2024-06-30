import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce_app/Core/Color/Colors.dart';
import 'package:e_commerce_app/Core/Common/Button/AppBar_icon_Button.dart';
import 'package:e_commerce_app/Core/Common/Button/Button.dart';
import 'package:e_commerce_app/Core/Common/Sized_Box/Sized_Box.dart';
import 'package:e_commerce_app/Core/Common/SnackBar/show_snack_bar.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Add-Product/Admin_product_Event.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Pick-Image/Pick_image_Bloc.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Widget/Add_product_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Bloc/Add-Product/Admin_product_Bloc.dart';
import '../Bloc/Add-Product/Admin_product_State.dart';
import '../Bloc/Pick-Image/Pick_image_Event.dart';
import '../Bloc/Pick-Image/Pick_image_State.dart';

class AddAdminProductPage extends StatefulWidget {
  const AddAdminProductPage({super.key});

  @override
  State<AddAdminProductPage> createState() => _AddAdminProductPageState();
}

class _AddAdminProductPageState extends State<AddAdminProductPage> {

  String category = 'Mobiles';

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  final _addAdminProductKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();


  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
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
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back, // Replace with the icon you want
              color: CustomColor.darkGreen,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Add  Product",
            style: TextStyle(fontFamily: "CopperPlateGothic"),
          ),
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        // backgroundColor: Colors.white,
        body: BlocConsumer<AdminProductBloc, AdminProductState>(
          listener: (context, adminState) {
            if (adminState is AdminProductErrorState) {
              customSnackBar(
                context: context,
                text: adminState.errorMessage,
                icon: Icons.error,
                bgColor: Colors.red,
              );
              BlocProvider.of<ImagePickerBloc>(context).add(ClearImagesEvent());
            }
            if (adminState is AdminProductLoadedState) {
              customSnackBar(
                context: context,
                text: "Successfully Posted",
                icon: Icons.error,
                bgColor: Colors.green,
              );
              Navigator.pop(context);
              BlocProvider.of<ImagePickerBloc>(context).add(ClearImagesEvent());
            }
          },
          builder: (context, adminState) {
            return adminState is AdminProductLoadingState
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : SingleChildScrollView(
                    child: Form(
                      key: _addAdminProductKey,
                      child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                        builder: (context, state) {
                          return BlocBuilder<ImagePickerBloc, ImagePickerState>(
                            builder: (context, state) {
                              if (state is ImagePickerLoadedState) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      gapHeight(25),
                                      state.images.isNotEmpty
                                          ? CarouselSlider(
                                              items: state.images.map(
                                                (i) {
                                                  return Builder(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Image.file(
                                                      i,
                                                      fit: BoxFit.cover,
                                                      height: 200,
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              options: CarouselOptions(
                                                viewportFraction: 1,
                                                reverse: false,
                                                pauseAutoPlayInFiniteScroll: false,
                                                enableInfiniteScroll: false,
                                                height: 200,
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                BlocProvider.of<
                                                            ImagePickerBloc>(
                                                        context)
                                                    .add(PickImageEvent());
                                              },
                                              child: DottedBorder(
                                                borderType: BorderType.RRect,
                                                radius:
                                                    const Radius.circular(10),
                                                dashPattern: const [10, 4],
                                                strokeCap: StrokeCap.round,
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.folder_open,
                                                        size: 40,
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      Text(
                                                        'Select Product Images',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors
                                                              .grey.shade400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                      gapHeight(25),
                                      addProductTextFormField(
                                        text: "Product Name",
                                        inputType: TextInputType.text,
                                        obscureText: false,
                                        controller: _productNameController,
                                        hintText: "Product Name",
                                      ),
                                      gapHeight(22),
                                      addProductTextFormField(
                                        text: "Product Description",
                                        inputType: TextInputType.text,
                                        obscureText: false,
                                        controller: _descriptionController,
                                        hintText: "Product Description",
                                        maxLine: 6,
                                      ),
                                      gapHeight(22),
                                      addProductTextFormField(
                                        text: "Product Price",
                                        inputType: TextInputType.number,
                                        obscureText: false,
                                        controller: _priceController,
                                        hintText: "Product Price",
                                      ),
                                      gapHeight(22),
                                      addProductTextFormField(
                                        text: "Product Quantity",
                                        inputType: TextInputType.number,
                                        obscureText: false,
                                        controller: _quantityController,
                                        hintText: "Product Quantity",
                                      ),
                                      gapHeight(22),
                                      Row(
                                        children: [
                                          const Text(
                                            "Product Category",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "*",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                      gapHeight(4),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border:
                                              Border.all(color: Colors.black12),
                                        ),
                                        child: DropdownButton(
                                          elevation: 0,
                                          dropdownColor:
                                              CustomColor.veryLightGreen,
                                          autofocus: true,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          underline: Container(
                                            height: 2.h,
                                            color: Colors.transparent,
                                          ),
                                          padding: EdgeInsets.only(
                                              top: 5.h,
                                              bottom: 5.h,
                                              right: 12.w,
                                              left: 12.w),
                                          value: category,
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          items: productCategories
                                              .map((String item) {
                                            return DropdownMenuItem(
                                              alignment: Alignment.center,
                                              value: item,
                                              child: Text(item),
                                            );
                                          }).toList(),
                                          onChanged: (String? newVal) {
                                            setState(() {
                                              category = newVal!;
                                            });
                                          },
                                        ),
                                      ),
                                      gapHeight(25),
                                      customButton(
                                        btnWidth: 340,
                                        onTap: () {
                                          BlocProvider.of<AdminProductBloc>(
                                                  context)
                                              .add(
                                            AddAdminProductEvent(
                                              productName:
                                                  _productNameController.text,
                                              description:
                                                  _descriptionController.text,
                                              image: state.images,
                                              price: _priceController.text,
                                              quantity:
                                                  _quantityController.text,
                                              category: category,
                                            ),
                                          );
                                        },
                                        btnText: "Add Product",
                                      ),
                                      gapHeight(30),
                                    ],
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
