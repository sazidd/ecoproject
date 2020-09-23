import 'package:flutter/cupertino.dart';

class Products {
  final int id;
  final String productName;
  final String productDesc;
  final String productImage;
  final double disCountProductPrice;
  final double productPrice;
  int qty;
  final int percentageDiscount;

  Products({
    this.id,
    this.productName,
    this.productDesc,
    this.productImage,
    this.disCountProductPrice,
    this.productPrice,
    this.qty,
    this.percentageDiscount,
  });
}

class ProductStore extends ChangeNotifier {
  List<Products> _products = [];

  List<Products> _basket = [];

  Products _activeProducts = null;

  ProductStore() {
    _products = [
      Products(
        id: 1,
        productName: "Girls Cloth 1",
        productDesc: "ShwapnoChura Colorful cloth",
        productImage: "assets/images/cloth.jpg",
        disCountProductPrice: 135,
        productPrice: 300,
        qty: 1,
        percentageDiscount: -49,
      ),
      Products(
        id: 2,
        productName: "Girls Cloth 2",
        productDesc: "ShwapnoChura Colorful cloth",
        productImage: "assets/images/cloth.jpg",
        disCountProductPrice: 135,
        productPrice: 300,
        qty: 1,
        percentageDiscount: -49,
      ),
      Products(
        id: 3,
        productName: "Girls Cloth 3",
        productDesc: "ShwapnoChura Colorful cloth",
        productImage: "assets/images/cloth.jpg",
        disCountProductPrice: 135,
        productPrice: 300,
        qty: 1,
        percentageDiscount: -49,
      ),
      Products(
        id: 4,
        productName: "Girls Cloth 4",
        productDesc: "ShwapnoChura Colorful cloth",
        productImage: "assets/images/cloth.jpg",
        disCountProductPrice: 135,
        productPrice: 300,
        qty: 1,
        percentageDiscount: -49,
      ),
    ];
    notifyListeners();
  }

  List<Products> get products => _products;
  List<Products> get basket => _basket;

  Products get activeProduct => _activeProducts;

  setActiveProduct(Products p) {
    _activeProducts = p;
  }

  addOneItemToBasket(Products p) {
    Products found =
        _basket.firstWhere((e) => e.id == p.id, orElse: () => null);
    if (found != null) {
      found.qty += 1;
    } else {
      _basket.add(p);
    }
    notifyListeners();
  }

  removeOneItemToBasket(Products p) {
    Products found =
        _basket.firstWhere((e) => e.id == p.id, orElse: () => null);
    if (found != null && found.qty == 1) {
      _basket.remove(p);
    } else {
      found.qty -= 1;
    }
    notifyListeners();
  }

  totalProduct() {
    int total = 0;
    for (int i = 0; i < _basket.length; i++) {
      total += _basket[i].qty;
    }
    return total;
  }
}

// List<Products> products = [
//   Products(
//     id: 1,
//     productDesc: "ShwapnoChura Colorful cloth",
//     productImage: "assets/images/cloth.jpg",
//     disCountProductPrice: 135,
//     productPrice: 300,
//     percentageDiscount: -49,
//   ),
//   Products(
//     id: 1,
//     productDesc: "ShwapnoChura Colorful cloth",
//     productImage: "assets/images/cloth.jpg",
//     disCountProductPrice: 135,
//     productPrice: 300,
//     percentageDiscount: -49,
//   ),
//   Products(
//     id: 1,
//     productDesc: "ShwapnoChura Colorful cloth",
//     productImage: "assets/images/cloth.jpg",
//     disCountProductPrice: 135,
//     productPrice: 300,
//     percentageDiscount: -49,
//   ),
//   Products(
//     id: 1,
//     productDesc: "ShwapnoChura Colorful cloth",
//     productImage: "assets/images/cloth.jpg",
//     disCountProductPrice: 135,
//     productPrice: 300,
//     percentageDiscount: -49,
//   ),
// ];
