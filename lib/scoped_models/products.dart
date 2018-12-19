import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {

  List<Product> _productsList = [];
  int _selectedProductIndex;

  List<Product> get products {
    return List.from(_productsList);
  }

  int get selectedIndex {
    return _selectedProductIndex;
  }

  Product getSelectedProduct() {
    if (_selectedProductIndex == null){
      return null;
    }
    return _productsList[_selectedProductIndex];
  }

  void addProduct(Product product) {
    // setState is used to dispatch any updates to the UI
      _productsList.add(product);
      _selectedProductIndex = null;
  }

  void removeProduct() {
      _productsList.removeAt(_selectedProductIndex);
      _selectedProductIndex = null;
  }

  void updateProduct(Product product)  {
      _productsList[_selectedProductIndex] = product;
      _selectedProductIndex = null;
  }

  void unsetSelectedIndex() {
    _selectedProductIndex = null;
  }

  void setSelectedProductIndex(int index){
    _selectedProductIndex = index;
  }

}