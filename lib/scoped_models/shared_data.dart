import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

class SharedDataModel extends Model {
  List<Product> productsList = [];
  int selectedProductIndex;
  User authenticatedUser;

  void addProduct(Product product) {
    // setState is used to dispatch any updates to the UI
    product.userEmail = authenticatedUser.email;
    product.userPassword = authenticatedUser.password;
    productsList.add(product);
    selectedProductIndex = null;
  }
}