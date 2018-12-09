import 'package:flutter/material.dart';

import './products.dart';
//import './product_btn.dart';

class ProductsManager extends StatelessWidget {

  final List<Map> productsList;

  // This receives the startingProduct from the main.dart file
  // and then passed to the state class to start with
  // The {} made it an optional argument that could have null value
  ProductsManager(this.productsList);




  // The initializer is used here to access the ProductManager properties
  // These properties are only accessible inside methods
  // This runs before the build method hence setState is not required
//  @override
//  void initState() {
//    // TODO: implement initState

    // widget refers to the ProductManager StatefulWidget class to access its
    // properties and methods
    // Named arguments vs Positional arguments

//    if (widget.startingProduct != null)
//      productsList.add(widget.startingProduct);
//    super.initState();
//  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
//        Container(
//          margin: EdgeInsets.all(10.0),
//          child: ProductBtn(addProduct),
//        ),
        // Expanded takes all the available space in the screen
        // We could've used Container but must've provided height attribute
        Expanded(child: Products(productsList))
      ],
    );
  }
}
