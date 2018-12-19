import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'product_create.dart';
import '../models/product.dart';
import '../scoped_models/products.dart';

class ProductsListPage extends StatelessWidget {

  void _navigateToUpdateForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProductCreatePage();
        },
      ),
    );
  }

  Widget _buildUpdateBtn(context) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        _navigateToUpdateForm(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<ProductsModel>(
      builder: (context, widget, model) {
        List<Product> products = model.products;
        return ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(index.toString()),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  print('swiped end to start');
                  model.setSelectedProductIndex(index);
                  model.removeProduct();
                }
              },
              child: Column(
                // To use a divider with the listTitle
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/food.jpg'),
                    ),
                    title: Text(products[index].title),
                    subtitle: Text('\$ ${products[index].price.toString()}'),
                    trailing: _buildUpdateBtn(context),
                    onTap: () {
                      model.setSelectedProductIndex(index);
                      _navigateToUpdateForm(context);
                    },
                  ),
                  Divider()
                ],
              ),
            );
          },
          itemCount: products.length,
        );
      }
    );

  }
}
