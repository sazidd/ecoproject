// import 'package:ecommerce/models/productModel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ConfirmOrderPage extends StatelessWidget {
//   static final String path = "lib/src/pages/ecommerce/confirm_order1.dart";
//   final String address = "Chabahil, Kathmandu";
//   final String phone = "9818522122";
//   //final double total = 500;
//   // final double delivery = 100;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Confirm Order"),
//       ),
//       body: _buildBody(context),
//     );
//   }

//   Widget _buildBody(BuildContext context) {
//     var productStore = Provider.of<ProductStore>(context);
//     return SingleChildScrollView(
//       padding:
//           EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text("Subtotal"),
//               Text("Rs. ${productStore.totalPrice()}"),
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text("Delivery fee"),
//               Text("Rs. ${productStore.activeProduct.deliveryFee}"),
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 "Total",
//                 style: Theme.of(context).textTheme.title,
//               ),
//               Text(
//                   "${productStore.totalPrice() + productStore.activeProduct.deliveryFee}",
//                   style: Theme.of(context).textTheme.title),
//             ],
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           Container(
//               color: Colors.grey.shade200,
//               padding: EdgeInsets.all(8.0),
//               width: double.infinity,
//               child: Text("Delivery Address".toUpperCase())),
//           Column(
//             children: <Widget>[
//               RadioListTile(
//                 selected: true,
//                 value: address,
//                 groupValue: address,
//                 title: Text(address),
//                 onChanged: (value) {},
//               ),
//               RadioListTile(
//                 selected: false,
//                 value: "New Address",
//                 groupValue: address,
//                 title: Text("Choose new delivery address"),
//                 onChanged: (value) {},
//               ),
//               Container(
//                   color: Colors.grey.shade200,
//                   padding: EdgeInsets.all(8.0),
//                   width: double.infinity,
//                   child: Text("Contact Number".toUpperCase())),
//               RadioListTile(
//                 selected: true,
//                 value: phone,
//                 groupValue: phone,
//                 title: Text(phone),
//                 onChanged: (value) {},
//               ),
//               RadioListTile(
//                 selected: false,
//                 value: "New Phone",
//                 groupValue: phone,
//                 title: Text("Choose new contact number"),
//                 onChanged: (value) {},
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           Container(
//               color: Colors.grey.shade200,
//               padding: EdgeInsets.all(8.0),
//               width: double.infinity,
//               child: Text("Payment Option".toUpperCase())),
//           RadioListTile(
//             groupValue: true,
//             value: true,
//             title: Text("Cash on Delivery"),
//             onChanged: (value) {},
//           ),
//           Container(
//             width: double.infinity,
//             child: RaisedButton(
//               color: Theme.of(context).primaryColor,
//               onPressed: () => {},
//               child: Text(
//                 "Confirm Order",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:ecommerce/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  int selectedRadio;
  int selectedPaymentRadio = 0;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedPaymentRadio(int value) {
    setState(() {
      selectedPaymentRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var productStore = Provider.of<ProductStore>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text(
          "CheckOut",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Text(
              "Shipping To",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Card(
            color: Colors.white,
            child: RadioListTile(
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("(319)555-0115"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("1749 Wheeler Ridge"),
                ],
              ),
              value: 1,
              groupValue: selectedRadio,
              onChanged: (val) {
                setSelectedRadio(val);
              },
              activeColor: Colors.red,
              secondary: Icon(
                Icons.edit,
                color: Colors.red,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.white,
            child: RadioListTile(
              title: Text(
                "Office",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("(207)555-0119"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("482 W Dallas St ubdefined"),
                ],
              ),
              value: 2,
              groupValue: selectedRadio,
              onChanged: (val) {
                setSelectedRadio(val);
              },
              activeColor: Colors.red,
              secondary: Icon(
                Icons.edit,
                color: Colors.red,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 6),
            child: Text(
              "payment Method",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            trailing: Radio(
              activeColor: Colors.red,
              value: 1,
              groupValue: selectedPaymentRadio,
              onChanged: (value) {
                setSelectedPaymentRadio(value);
              },
            ),
            leading: Image.asset(
              "assets/icons/creditCard.png",
              height: 30,
              width: 30,
            ),
            title: Text("Credit Card"),
          ),
          ListTile(
            trailing: Radio(
              activeColor: Colors.red,
              value: 2,
              groupValue: selectedPaymentRadio,
              onChanged: (value) {
                setSelectedPaymentRadio(value);
              },
            ),
            leading: Image.asset(
              "assets/icons/google.png",
              height: 27,
              width: 27,
            ),
            title: Text("Google Pay"),
          ),
          ListTile(
            trailing: Radio(
              activeColor: Colors.red,
              value: 3,
              groupValue: selectedPaymentRadio,
              onChanged: (value) {
                setSelectedPaymentRadio(value);
              },
            ),
            leading: Image.asset(
              "assets/icons/paypal.png",
              height: 30,
              width: 30,
            ),
            title: Text("Google Pay"),
          ),
          Card(
            color: Colors.grey[300].withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: Text("SubTotal"),
                  trailing: Text("Rs.${productStore.totalPrice()}"),
                ),
                ListTile(
                  leading: Text("Delivery fee"),
                  trailing:
                      Text("Rs. ${productStore.activeProduct.deliveryFee}"),
                ),
                ListTile(
                  leading: Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                      "${productStore.totalPrice() + productStore.activeProduct.deliveryFee}"),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () {},
                  child: Text(
                    "Confirm Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
