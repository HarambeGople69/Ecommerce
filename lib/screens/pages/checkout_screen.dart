import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/services/card_management/cart_management.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';
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
  FocusNode _name_node = FocusNode();
  FocusNode _billing_node = FocusNode();
  FocusNode _delivery_node = FocusNode();
  FocusNode _telephone_node = FocusNode();
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
                  icon: Icons.person,
                  start: _name_node,
                  end: _billing_node,
                  controller: _name_controller,
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return null;
                    } else {
                      return "Cannot be empty";
                    }
                  },
                  title: "User Name",
                  type: TextInputType.name,
                  number: 0,
                ),
                OurSizedBox(),
                CustomTextField(
                  icon: Icons.location_on,
                  start: _billing_node,
                  end: _delivery_node,
                  controller: _billing_address_controller,
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return null;
                    } else {
                      return "Cannot be empty";
                    }
                  },
                  title: "Billing Address",
                  type: TextInputType.streetAddress,
                  number: 0,
                ),
                OurSizedBox(),
                CustomTextField(
                  icon: Icons.location_on,
                  start: _delivery_node,
                  end: _telephone_node,
                  controller: _delivery_address_controller,
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return null;
                    } else {
                      return "Cannot be empty";
                    }
                  },
                  title: "Delivery Address",
                  type: TextInputType.streetAddress,
                  number: 0,
                ),
                OurSizedBox(),
                CustomTextField(
                  icon: Icons.phone,
                  start: _telephone_node,
                  controller: _telephone_controller,
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return null;
                    } else {
                      return "Cannot be empty";
                    }
                  },
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
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                          ),
                        ),
                      ),
                    ),
                    OurElevatedButton(
                      title: "Check Out",
                      function: () {
                        if (_formKey.currentState!.validate()) {
                          OurToast().showSuccessToast("Submitted successfully");
                        } else {}
                      },
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
