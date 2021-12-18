import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorlizer/colorlizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/our_product_model.dart';
import 'package:myapp/widgets/our_sized_box.dart';

class OurProductDetail extends StatefulWidget {
  final Product product;
  const OurProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  _OurProductDetailState createState() => _OurProductDetailState();
}

class _OurProductDetailState extends State<OurProductDetail> {
  ColorLizer colorlizer = ColorLizer();
  Color? color;
  int? price;
  bool isadded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = colorlizer.getRandomColors();
    price = int.parse(widget.product.price!.split("\$")[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(5),
          vertical: ScreenUtil().setSp(2),
        ),
        decoration: BoxDecoration(
          color: color!.withOpacity(0.6),
          borderRadius: BorderRadius.circular(
            ScreenUtil().setSp(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OurSizedBox(),
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
                height: ScreenUtil().setSp(150),
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(15),
                        vertical: ScreenUtil().setSp(3),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      color!.withOpacity(1),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isadded = !isadded;
                    });
                  },
                  child: Text(
                    isadded ? "Remove item " : "Add to cart",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
