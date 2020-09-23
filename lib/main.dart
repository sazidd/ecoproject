import 'package:ecommerce/models/productModel.dart';
import 'package:ecommerce/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/productCategoryModel.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductCategoryStore(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red
//        textTheme: Theme.of(context).textTheme.apply(bodyColor:  kTextColor)
            ),
        home: HomePage(),
      ),
    );
  }
}

//home: DetailsScreen(
//product: products[1],
//),
