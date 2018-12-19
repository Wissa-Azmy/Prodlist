import 'package:flutter/material.dart';

import 'product_create.dart';
import 'products_list.dart';

class ProductsAdminPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // leading drawer - endDrawer is for trailing drawer
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                // To remove the Hamburger icon from the side menu appBar
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text('Products'),
                // The empty onTap method will only add the clickable effect.
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/producs-list');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Products Admin'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              text: 'Create Product',
              icon: Icon(Icons.add),
            ),
            Tab(
              text: 'My Products',
              icon: Icon(Icons.list),
            )
          ]),
        ),
        body: TabBarView(children: <Widget>[
          ProductCreatePage(),
          ProductsListPage()
        ]),
      ),
    );
  }
}
