import 'package:flutter/cupertino.dart';

class ProductCategoryModel {
  int id;
  String categoryName;
  String categoryImage;
  double categoryPrice;

  ProductCategoryModel({
    this.id,
    this.categoryName,
    this.categoryImage,
    this.categoryPrice,
  });
}

class ProductCategoryStore extends ChangeNotifier {
  List<ProductCategoryModel> _productCategory = [];

  ProductCategoryModel _activeProductCategory = null;

  ProductCategoryStore() {
    _productCategory = [
      ProductCategoryModel(
        id: 1,
        categoryName: "Bags & Luggage",
        categoryImage: "assets/images/bags.jpg",
        categoryPrice: 500,
      ),
      ProductCategoryModel(
        id: 2,
        categoryName: "Beauty & BodyCare",
        categoryImage: "assets/images/bodyCare.jpg",
        categoryPrice: 500,
      ),
      ProductCategoryModel(
        id: 3,
        categoryName: "Books & Stationery",
        categoryImage: "assets/images/books.jpg",
        categoryPrice: 500,
      ),
      ProductCategoryModel(
        id: 4,
        categoryName: "Laptop",
        categoryImage: "assets/images/mac.jpg",
        categoryPrice: 500,
      ),
      ProductCategoryModel(
        id: 5,
        categoryName: "Desktop",
        categoryImage: "assets/images/desktop.jpg",
        categoryPrice: 500,
      ),
      ProductCategoryModel(
        id: 6,
        categoryName: "Watch",
        categoryImage: "assets/images/watch.jpg",
        categoryPrice: 500,
      ),
    ];
    notifyListeners();
  }

  List<ProductCategoryModel> get productCategory => _productCategory;
  ProductCategoryModel get activeProductCategory => _activeProductCategory;

  setActiveProductCategory(ProductCategoryModel p) {
    _activeProductCategory = p;
  }
}
// List<ProductCategoryModel> productCategoryModel = [
//   ProductCategoryModel(
//     id: 1,
//     categoryName: "Bags & Luggage",
//     categoryImage: "assets/images/bags.jpg",
//     categoryPrice: 500,
//   ),
//   ProductCategoryModel(
//     id: 2,
//     categoryName: "Beauty & BodyCare",
//     categoryImage: "assets/images/bodyCare.jpg",
//     categoryPrice: 500,
//   ),
//   ProductCategoryModel(
//     id: 3,
//     categoryName: "Books & Stationery",
//     categoryImage: "assets/images/books.jpg",
//     categoryPrice: 500,
//   ),
//   ProductCategoryModel(
//     id: 4,
//     categoryName: "Laptop",
//     categoryImage: "assets/images/mac.jpg",
//     categoryPrice: 500,
//   ),
//   ProductCategoryModel(
//     id: 5,
//     categoryName: "Desktop",
//     categoryImage: "assets/images/desktop.jpg",
//     categoryPrice: 500,
//   ),
//   ProductCategoryModel(
//     id: 6,
//     categoryName: "Watch",
//     categoryImage: "assets/images/watch.jpg",
//     categoryPrice: 500,
//   ),
// ];
