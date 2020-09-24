import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/models/functionModel.dart';
import 'package:ecommerce/models/productCategoryModel.dart';
import 'package:ecommerce/models/productModel.dart';
import 'package:ecommerce/screens/addToCart.dart';
import 'package:ecommerce/screens/details_screen.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:ecommerce/widgets/drawer.dart';
import 'package:ecommerce/widgets/functionality.dart';
import 'package:ecommerce/widgets/itemCard.dart';
import 'package:ecommerce/widgets/productCategoryCard.dart';
import 'package:ecommerce/widgets/sliders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../confiq.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var productCategoryStore = Provider.of<ProductCategoryStore>(context);
    var productStore = Provider.of<ProductStore>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xffb74093)),
        title: Text(
          "KENA KATA",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.message),
            tooltip: 'Add new entry',
            onPressed: () {/* ... */},
          ),
        ],
        bottom: PreferredSize(
            child: _searchBar(), preferredSize: Size.fromHeight(50)),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.shop),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
            height: 200,
            child: ImageSliderDemo(),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          // _searchBar(),
          // _buildOfferContainer(),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: functionality.length,
                itemBuilder: (context, index) => Functionality(
                  functionModel: functionality[index],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
//                  scrollDirection: Axis.vertical,
                itemCount: productCategoryStore.productCategory.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
//                     mainAxisSpacing: 10,
//                     crossAxisSpacing: 10,
//                  childAspectRatio: 0.80,
                ),
                itemBuilder: (context, index) => ProductCategoryCard(
                  product: productCategoryStore.productCategory[index],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFFFF5733),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Just For You                                                                                  ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: productStore.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
//                      crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      productStore
                          .setActiveProduct(productStore.products[index]);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                        ),
                      );
                    },
                    child: ItemCard(
                      product: productStore.products[index],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: ColorMaterial.lightColor,
        height: 50,
        items: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              print('object');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              productStore.setActiveProduct(productStore.activeProduct);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddToCart()),
              );
            },
          ),
          Icon(
            Icons.sms,
            color: Colors.black,
            size: 20,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 20,
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              print('object');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.search),
          Flexible(
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(5),
                hintText: "Search Product",
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
