import '../models/product.dart';
import 'shared_data.dart';

class ProductsModel extends SharedDataModel {


  bool showFavorites = false;

  List<Product> get products {
    // returning a new List to avoid returning the reference of the original list
    return List.from(productsList);
  }

  int get selectedIndex {
    return selectedProductIndex;
  }

  Product getSelectedProduct() {
    if (selectedProductIndex == null){
      return null;
    }
    return productsList[selectedProductIndex];
  }


  void removeProduct() {
      productsList.removeAt(selectedProductIndex);
      selectedProductIndex = null;
  }

  void updateProduct(Product product)  {
      productsList[selectedProductIndex] = product;
      selectedProductIndex = null;
  }

  void unsetSelectedIndex() {
    selectedProductIndex = null;
    notifyListeners();
  }

  void setSelectedProductIndex(int index){
    selectedProductIndex = index;
    // This notifier rebuilds the ScopedModelDependents
    notifyListeners();
  }


  void setProductFavStatus(int index, bool status) {
    productsList[index].isFavorite = status;
    notifyListeners();
  }

  void toggleDisplayMode() {
    showFavorites = !showFavorites;
    notifyListeners();
  }

  List<Product> get displayedProducts {
    if (showFavorites) {
      return List.from(
        productsList.where((product) => product.isFavorite).toList()
      );
    }
    return List.from(productsList);
  }

}