import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/pages/carts_screen.dart';
import 'package:myapp/screens/pages/products_screen.dart';
import 'package:myapp/services/google_authentication_service.dart/google_authentication_service.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Widget> widgets= [
    ProductScreen(),
    CartScreen()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[index],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              size: ScreenUtil().setSp(25),
            ),
            title: Text(
              "Products",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(15),
              ),
            ),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.shopping_basket_outlined,
              size: ScreenUtil().setSp(25),
            ),
            title: Text(
              "Cart",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(15),
              ),
            ),
            selectedColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
