import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {

  List<Product> _productsList = [];

  List<Product> get products {
    return List.from(_productsList);
  }

  void _addProduct(Product product) {
    // setState is used to dispatch any updates to the UI
      _productsList.add(product);
  }

  void _removeProduct(int index) {
      _productsList.removeAt(index);
  }

  void _updateProduct(int index, Product product)  {
      _productsList[index] = product;
  }

}