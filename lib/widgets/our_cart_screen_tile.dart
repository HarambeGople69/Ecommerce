import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorlizer/colorlizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/our_product_model.dart';
import 'package:myapp/services/card_management/cart_management.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:provider/provider.dart';

class CartScreenTile extends StatefulWidget {
  final Product product;
  const CartScreenTile({Key? key, required this.product}) : super(key: key);

  @override
  _CartScreenTileState createState() => _CartScreenTileState();
}

class _CartScreenTileState extends State<CartScreenTile> {
  int number = 1;
  ColorLizer colorlizer = ColorLizer();
  Color? color;
  int? price;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      number = widget.product.number ?? 1;
    });

    super.initState();
    color = colorlizer.getRandomColors();
    price = int.parse(widget.product.price!.split("\$")[1]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("=========================");
        print(widget.product.number.toString());
      },
      child: Container(
        // height: ScreenUtil().setSp(120),
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(2),
          vertical: ScreenUtil().setSp(5),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(5),
          vertical: ScreenUtil().setSp(5),
        ),
        decoration: BoxDecoration(
          color: color!.withOpacity(0.6),
          borderRadius: BorderRadius.circular(
            ScreenUtil().setSp(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setSp(10),
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    imageUrl:
                        "https://electronic-ecommerce.herokuapp.com/${widget.product.image!}",
                    width: ScreenUtil().setSp(100),
                    height: ScreenUtil().setSp(100),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setSp(2),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OurSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name: ",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                        Text(
                          widget.product.name!,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price: ",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                        Text(
                          "Rs. ${(price! * 100).toString()}",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Stock: ",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                        Text(
                          widget.product.stock!.toString(),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Created date: ",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                        Text(
                          DateFormat("dd/MM/yyyy").format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  widget.product.createDate!)),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    OurSizedBox(),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .removeCounter(widget.product);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    if (number != 1) {
                      setState(() {
                        number--;
                      });
                      Provider.of<CartProvider>(context, listen: false)
                          .updateProduct(widget.product, number);
                    }
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(number.toString()),
                IconButton(
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                    Provider.of<CartProvider>(context, listen: false)
                        .updateProduct(widget.product, number);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
