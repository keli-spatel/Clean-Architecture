import 'package:e_commerce_app/Features/Cart/Presentation/Page/Cart_Page.dart';
import 'package:e_commerce_app/Features/Categories/Presentation/Page/Categories_Page.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Page/Home_Page.dart';
import 'package:e_commerce_app/Features/Search/presentation/Page/Search_Page.dart';
import 'package:flutter/cupertino.dart';

import '../../../Profile/Presentation/Page/Profile_page.dart';


class BottomNavigationBarItemWidget extends StatelessWidget {
  final int index;
  const BottomNavigationBarItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widget = [
      HomePage(),
      CategoriesPage(),
      SearchPage(),
      CartPage(),
      ProfilePage(),
    ];
    return widget[index];
  }
}
