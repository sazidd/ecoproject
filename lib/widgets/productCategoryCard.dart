
import 'package:ecommerce/models/productCategoryModel.dart';
import 'package:flutter/material.dart';

class ProductCategoryCard extends StatelessWidget {
  final ProductCategoryModel product;

  ProductCategoryCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
              height: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffF2F3F4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                product.categoryImage,
                fit: BoxFit.cover,
              )),
        ),
        Center(
          child: Text(
            product.categoryName,
            style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
