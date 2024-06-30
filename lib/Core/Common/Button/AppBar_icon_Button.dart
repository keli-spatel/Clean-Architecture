import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Color/Colors.dart';

IconButton appBarIconButton(BuildContext context){
  return IconButton(
    icon: const Icon(
      CupertinoIcons.back, // Replace with the icon you want
      color: CustomColor.darkGreen,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}