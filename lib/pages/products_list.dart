import 'package:flutter/material.dart';

import 'product_create.dart';
import '../models/product.dart';

class ProductsListPage extends StatelessWidget {
  final List<Product> _productsList;
  final Function updateProduct;
  final Function deleteProduct;

  ProductsListPage(this.deleteProduct, this.updateProduct, this._productsList);

  void _navigateToUpdateForm(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProductCreatePage(
              updateProduct: updateProduct,
              index: index,
              product: _productsList[index]
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(index.toString()),
          background: Container(color: Colors.red,),
          onDismissed: (DismissDirection direction){
            if (direction == DismissDirection.endToStart){
              print('swiped end to start');
              deleteProduct(index);
            }
          },
          child: Column( // To use a divider with the listTitle
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/food.jpg'),
                ),
                title: Text(_productsList[index].title),
                subtitle: Text('\$ ${_productsList[index].price.toString()}'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _navigateToUpdateForm(context, index);
                  },
                ),
                onTap: (){
                  _navigateToUpdateForm(context, index);
                },
              ),
              Divider()
            ],
          ),
        );
      },
      itemCount: _productsList.length,
    );
  }
}
