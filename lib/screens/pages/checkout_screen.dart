import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/services/card_management/cart_management.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_text_field.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name_controller = TextEditingController();
  TextEditingController _billing_address_controller = TextEditingController();
  TextEditingController _delivery_address_controller = TextEditingController();
  TextEditingController _telephone_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(10),
          vertical: ScreenUtil().setSp(5),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: _name_controller,
                  validator: (value) {},
                  title: "User Name",
                  type: TextInputType.name,
                  number: 1,
                ),
                OurSizedBox(),
                CustomTextField(
                  controller: _billing_address_controller,
                  validator: (value) {},
                  title: "Billing Address",
                  type: TextInputType.streetAddress,
                  number: 1,
                ),
                OurSizedBox(),
                CustomTextField(
                  controller: _delivery_address_controller,
                  validator: (value) {},
                  title: "Delivery Address",
                  type: TextInputType.streetAddress,
                  number: 1,
                ),
                OurSizedBox(),
                CustomTextField(
                  controller: _telephone_controller,
                  validator: (value) {},
                  title: "Telephone no:",
                  type: TextInputType.phone,
                  number: 1,
                ),
                OurSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(10),
                        vertical: ScreenUtil().setSp(5),
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setSp(20),
                        ),
                      ),
                      height: ScreenUtil().setSp(45),
                      child: Center(
                        child: Text(
                          "Total Price: Rs ${Provider.of<CartProvider>(context).total_price}",
                        ),
                      ),
                    ),
                    OurElevatedButton(
                      title: "Check Out",
                      function: () {},
                    ),
                  ],
                ),
                OurSizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
