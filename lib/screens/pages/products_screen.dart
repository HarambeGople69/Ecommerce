import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/apis/api_service.dart';
import 'package:myapp/models/our_product_model.dart';
import 'package:intl/intl.dart';
import 'package:myapp/services/card_management/cart_management.dart';
import 'package:myapp/services/google_authentication_service.dart/google_authentication_service.dart';
import 'package:myapp/widgets/our_product_details.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int tag = 0;
  List<Product> productList = [];
  String catagory = "All";
  List<String> options = [
    "All",
    "Electronic",
    "Laptop",
    "Mobile",
    "Watch",
    "Keyboard",
    "Headseat"
  ];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              print(Provider.of<CartProvider>(context, listen: false).products);
            },
            child: Center(
              child: Badge(
                badgeContent:
                    Text(Provider.of<CartProvider>(context).counter.toString()),
                animationDuration: Duration(milliseconds: 300),
                child: Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),
            ),
          ),
          title: Text("My Products"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                await GoogleAuth().logout(context);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(5),
              vertical: ScreenUtil().setSp(5),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    children: List<Widget>.generate(
                      7,
                      (int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setSp(5),
                            vertical: ScreenUtil().setSp(5),
                          ),
                          child: ChoiceChip(
                            label: Text(
                              options[index],
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                              ),
                            ),
                            selected: tag == index,
                            onSelected: (bool selected) {
                              setState(() {
                                catagory = "";
                                productList = [];
                                tag = selected ? index : 0;
                                catagory = options[tag];
                                print(catagory);
                              });
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: APIservice().fetchdata(catagory),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          // ProductModel productModel =
                          //     ProductModel.fromJson(snapshot.data);

                          // productModel.data!.product!.forEach((element) {
                          //   if (catagory == element.category) {
                          //     print("================");
                          //     print(element.name);
                          //     setState(() {
                          //       productList.add(
                          //         Product.fromJson(
                          //           element.toJson(),
                          //         ),
                          //       );
                          //     });
                          //   }
                          // });
                          // return ListView.builder(
                          //     itemCount: productModel.data!.product!.length,
                          //     itemBuilder: (context, index) {
                          //       return Text(productModel.data!.product![index].name!);
                          //     });

                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return OurProductDetail(
                                  product: snapshot.data[index]);
                            },
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.count(2, index.isEven ? 4 : 3.5),
                            mainAxisSpacing: ScreenUtil().setSp(10),
                            crossAxisSpacing: ScreenUtil().setSp(10),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
