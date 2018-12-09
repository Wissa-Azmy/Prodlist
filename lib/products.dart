import 'package:flutter/material.dart';

import 'widgets/product_card.dart';

class Products extends StatefulWidget {
  // final means the productsList array will not be changed once initialized
  final List<Map> productsList;

  // This is the class constructor. it must has the same class name
  Products(this.productsList);
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

  Widget _buildProductsList() {
    Widget productsCards =
        Center(child: Text('No products found, please add some'));

    if (widget.productsList.length > 0) {
      // ListView: for static lists (renders all items and load them in memory)
      // ListView.builder: for dynamic lists
      productsCards = ListView.builder(
        itemBuilder: (context, int index) => ProductCard(widget.productsList[index]),
        itemCount: widget.productsList.length,
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
    return _buildProductsList();
  }
}
