import 'package:ecommerce/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemCard extends StatelessWidget {
  final Products product;
  ItemCard({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffF2F3F4),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            child: Hero(
              tag: product.id,
                          child: Image.asset(
                product.productImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                backgroundColor: Colors.green,
                label: Text(
                  "SALE",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Chip(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(),
                label: Text(
                  "${product.percentageDiscount}%",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Text(
            product.productDesc,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$${product.disCountProductPrice}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "\$${product.productPrice}",
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
  //   return FlatButton(
  //     child: Container(
  //       padding: EdgeInsets.all(10),
  //       decoration: BoxDecoration(
  //         color: Color(0xffF2F3F4),
  //         borderRadius: BorderRadius.circular(13),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Image.asset(
  //             product.productImage,
  //             fit: BoxFit.cover,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Chip(
  //                 backgroundColor: Colors.green,
  //                 label: Text(
  //                   "SALE",
  //                   style: TextStyle(
  //                       fontSize: 13,
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               Chip(
  //                 backgroundColor: Colors.red,
  //                 shape: RoundedRectangleBorder(),
  //                 label: Text(
  //                   "${product.percentageDiscount}%",
  //                   style: TextStyle(
  //                       fontSize: 15,
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               )
  //             ],
  //           ),
  //           Text(
  //             product.productDesc,
  //             style: TextStyle(
  //               fontSize: 10,
  //               color: Colors.black,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           Text(
  //             "\$${product.disCountProductPrice}",
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           Text(
  //             "\$${product.productPrice}",
  //             style: TextStyle(
  //                 decoration: TextDecoration.lineThrough,
  //                 decorationThickness: 2,
  //                 fontSize: 15),
  //           ),
  //         ],
  //       ),
  //     ),
  //     onPressed: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => DetailsScreen(
  //                   name: product.productImage,
  //                 )),
  //       );
  //     },
  //   );
  // }
}
