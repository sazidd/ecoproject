import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 20, left: 0, right: 0),
              padding: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text("Blouse E20",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              child: Column(children: [
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.keyboard_arrow_left),
                          onPressed: null),
                      Image.asset(
                        "assets/images/ladies_coat.png",
                        height: 200,
                        width: 200,
                      ),
                      IconButton(
                          icon: Icon(Icons.keyboard_arrow_right),
                          onPressed: null),
                    ],
                  ),
                ),
                Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 150),
                            child: IconButton(
                                icon: Icon(Icons.more_horiz), onPressed: null)),
                        Container(
                          child: IconButton(
                              icon: Icon(Icons.bookmark_border),
                              onPressed: null),
                        )
                      ],
                    )),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 60,
                    width: 155,
                    color: Colors.white,
                    margin: EdgeInsets.only(right: 3),
                    child: Text("Size(US):"),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 60,
                    width: 65,
                    color: Colors.white,
                    margin: EdgeInsets.only(right: 3),
                    child: Text(
                      "4",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 60,
                    width: 65,
                    color: Colors.grey,
                    margin: EdgeInsets.only(right: 3),
                    child: Text(
                      "6",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 60,
                    width: 65,
                    color: Colors.white,
                    child: Text(
                      "8",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 248,
              width: 358,
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Color:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          IconButton(
                              padding: EdgeInsets.only(left: 90),
                              icon: Icon(Icons.radio_button_checked),
                              color: Colors.red,
                              iconSize: 33.0,
                              onPressed: null),
                          IconButton(
                              padding: EdgeInsets.only(left: 10),
                              icon: Icon(Icons.radio_button_unchecked),
                              color: Colors.red,
                              iconSize: 33.0,
                              onPressed: null),
                          IconButton(
                              padding: EdgeInsets.only(left: 10),
                              icon: Icon(Icons.radio_button_unchecked),
                              color: Colors.red,
                              iconSize: 33.0,
                              onPressed: null),
                          IconButton(
                              padding: EdgeInsets.only(left: 10),
                              icon: Icon(Icons.radio_button_unchecked),
                              color: Colors.red,
                              iconSize: 33.0,
                              onPressed: null),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Composition:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Text("100% Silk",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Price:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          IconButton(
                              padding: EdgeInsets.only(left: 180),
                              icon: Icon(Icons.monetization_on)),
                          Text("349.99",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(

                        children: [
                          ButtonBar(
                            children: [
                              FlatButton( child: Text("Add to basket",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18)))
                              ,],
                          ),

                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
