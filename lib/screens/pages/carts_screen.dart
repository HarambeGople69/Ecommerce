import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorlizer/colorlizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/models/our_product_model.dart';
import 'package:myapp/screens/pages/checkout_screen.dart';
import 'package:myapp/services/card_management/cart_management.dart';
import 'package:myapp/widgets/our_cart_screen_tile.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<Product> productLists = Provider.of<CartProvider>(context).products;
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(10),
            vertical: ScreenUtil().setSp(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: productLists.length != 0
                    ? ListView.builder(
                        itemCount: productLists.length,
                        itemBuilder: (context, index) {
                          return CartScreenTile(product: productLists[index]);
                        },
                      )
                    : Lottie.asset(
                        "assets/animations/empty_cart.json",
                        fit: BoxFit.contain,
                      ),
              ),
              Container(
                // margin: EdgeInsets.symmetric(
                //   horizontal: ScreenUtil().setSp(10),
                //   vertical: ScreenUtil().setSp(5),
                // ),
                // padding: EdgeInsets.symmetric(
                //   horizontal: ScreenUtil().setSp(10),
                //   vertical: ScreenUtil().setSp(5),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setSp(20),
                          ),
                        ),
                        height: ScreenUtil().setSp(50),
                        child: Center(
                          child: Text(
                            "Total Price: Rs ${Provider.of<CartProvider>(context).total_price}",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setSp(10),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: ScreenUtil().setSp(50),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.purple),
                            shape: MaterialStateProperty.all(
                              StadiumBorder(),
                            ),
                          ),
                          onPressed:
                              Provider.of<CartProvider>(context).total_price ==
                                      0.0
                                  ? null
                                  : () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return CheckOutPage();
                                          },
                                        ),
                                      );
                                    },
                          child: Text(
                            "Check out",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
