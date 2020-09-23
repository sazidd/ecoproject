import 'package:ecommerce/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productStore = Provider.of<ProductStore>(context);
    return Scaffold(
      appBar: AppBar(
//      backgroundColor: product.color,
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
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: null,
          ),
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              new IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              new CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
                child: new Text(
                  productStore.totalProduct().toString(),
                  style: new TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              )
            ],
          )
          // IconButton(
          //     icon: SvgPicture.asset(
          //       "assets/icons/cart.svg",
          //       color: Colors.white,
          //     ),
          //     onPressed: null)
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 250,
              width: 250,
              child: Image.asset(
                productStore.activeProduct.productImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  productStore.activeProduct.productName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                child: Text(
                  "\$${productStore.activeProduct.disCountProductPrice}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Text(
                  productStore.activeProduct.productDesc,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Text(
                  "\$${productStore.activeProduct.productPrice}",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      productStore
                          .addOneItemToBasket(productStore.activeProduct);
                    },
                  ),
                  Container(
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        productStore.activeProduct.qty.toString(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      productStore
                          .removeOneItemToBasket(productStore.activeProduct);
                    },
                  ),
                ],
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(
              //         icon: Icon(
              //           Icons.add,
              //           color: Colors.red,
              //         ),
              //         onPressed: () {
              //           productStore
              //               .addOneItemToBasket(productStore.activeProduct);
              //         }),
              //     Container(
              //       width: 18,
              //       decoration: BoxDecoration(
              //         border: Border.all(),
              //       ),
              //       child: Text(
              //         productStore.activeProduct.qty.toString(),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //     IconButton(
              //       icon: Icon(
              //         Icons.remove,
              //         color: Colors.green,
              //       ),
              //       onPressed: () {
              //         productStore
              //             .removeOneItemToBasket(productStore.activeProduct);
              //       },
              //     ),
              //   ],
              // ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Container(
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      productStore.totalProduct();
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
