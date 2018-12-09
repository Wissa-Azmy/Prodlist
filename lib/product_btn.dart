import 'package:flutter/material.dart';

class ProductBtn extends StatelessWidget {
  final Function addProduct;

  ProductBtn(this.addProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      color: Theme.of(context).accentColor,
      onPressed: () {
        addProduct({'title': 'Sweet', 'image': 'assets/food.jpg'});
      },
      child: Text('Add Product'),
    );
  }
}