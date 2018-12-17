import 'package:flutter/material.dart';

import 'product_create.dart';

class ProductsListPage extends StatelessWidget {
  final List<Map> _productsList;
  final Function updateProduct;

  ProductsListPage(this.updateProduct, this._productsList);

  void _navigateToUpdateForm(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProductCreatePage(updateProduct: updateProduct, index: index, product: _productsList[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: new Image(image: new AssetImage('assets/food.jpg')),
          ),
//          Image.asset('assets/food.jpg'),
          title: Text(_productsList[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _navigateToUpdateForm(context, index);
            },
          ),
          onTap: (){
            _navigateToUpdateForm(context, index);
          },
        );
      },
      itemCount: _productsList.length,
    );
  }
}
