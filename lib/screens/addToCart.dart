import 'package:ecommerce/constant/constants.dart';
import 'package:ecommerce/models/productModel.dart';
import 'package:ecommerce/screens/confirmPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/cart2.dart";
  @override
  Widget build(BuildContext context) {
    var productStore = Provider.of<ProductStore>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    color: Colors.white,
                  ),
                  onPressed: null),
              new CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
                child: new Text(
                  productStore.totalProduct().toString(),
                  style: new TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              )
            ],
          ),
          SizedBox(
            width: kDefaultPaddin / 2,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: productStore.basket.length,
              itemBuilder: (context, index) {
                return RoundedContainer(
                  padding: const EdgeInsets.all(0),
                  margin: EdgeInsets.all(10),
                  height: 130,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              productStore.basket[index].productImage,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      "Item 1" + index.toString(),
                                      overflow: TextOverflow.fade,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    child: IconButton(
                                      onPressed: () {
                                        productStore.removeItem(
                                            productStore.basket[index]);
                                      },
                                      color: Colors.red,
                                      icon: Icon(Icons.delete),
                                      iconSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Price: "),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '\$${productStore.basket[index].productPrice}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Sub Total: "),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('${productStore.basket[index].subTotal}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.orange,
                                      ))
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Ships Free",
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          productStore.removeOneItemToBasket(
                                              productStore.basket[index]);
                                        },
                                        splashColor: Colors.redAccent.shade200,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.redAccent,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            productStore.basket[index].qty
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          productStore.addOneItemToBasket(
                                              productStore.basket[index]);
                                        },
                                        splashColor: Colors.lightBlue,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Material(
            color: Colors.black12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Checkout Price:",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Text(
                          "Rs. ${productStore.totalPrice()}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.red,
                    elevation: 1.0,
                    child: InkWell(
                      splashColor: Colors.redAccent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmOrderPage()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Checkout",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
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

  // Widget _checkoutSection(BuildContext context) {
  //   return Material(
  //     color: Colors.black12,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Padding(
  //             padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
  //             child: Row(
  //               children: <Widget>[
  //                 Text(
  //                   "Checkout Price:",
  //                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  //                 ),
  //                 Spacer(),
  //                 Text(
  //                   "Rs. 5000",
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  //                 )
  //               ],
  //             )),
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Material(
  //             color: Colors.red,
  //             elevation: 1.0,
  //             child: InkWell(
  //               splashColor: Colors.redAccent,
  //               onTap: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => ConfirmOrderPage()),
  //                 );
  //               },
  //               child: Container(
  //                 width: double.infinity,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(10.0),
  //                   child: Text(
  //                     "Checkout",
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.w700),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key key,
    @required this.child,
    this.height,
    this.width,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    this.borderRadius,
    this.alignment,
    this.elevation,
  }) : super(key: key);
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final AlignmentGeometry alignment;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.all(0),
      color: color,
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(20.0),
      ),
      child: Container(
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}
