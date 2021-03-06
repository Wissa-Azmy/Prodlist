import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'widgets/product_card.dart';
import 'models/product.dart';
import 'scoped_models/main.dart';

class Products extends StatefulWidget {
  // final means the productsList array will not be changed once initialized
//  final List<Product> productsList;

  // This is the class constructor. it must has the same class name
//  Products(this.productsList);
  // The above code translates to:
  /*
    Products(productsList) {
      this.productsList = productsList
    }
  */

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsState();
  }
}

class _ProductsState extends State<Products> {

  Widget _buildProductsList(List<Product> productsList) {

    for (Product product in productsList) {
      print("${product.title}: ${product.isFavorite}");
    }

    Widget productsCards = Center(
        child: Text('No products found, please add some')
    );

    if (productsList.length > 0) {
      // ListView: for static lists (renders all items and load them in memory)
      // ListView.builder: for dynamic lists
      productsCards = ListView.builder(
        itemBuilder: (context, int index) =>
            ProductCard(productsList[index], index),
        itemCount: productsList.length,
      );
    }

    /*
    else {
      // avoid returning null widgets instead return an empty container
      productsCards = Container()
    }
    */

    return productsCards;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
      builder: (context, widget, model) {
        return _buildProductsList(model.displayedProducts);
      },
    );
  }
}
