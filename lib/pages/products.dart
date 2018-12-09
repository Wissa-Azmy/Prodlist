import 'Package:flutter/Material.Dart';

import '../products.dart';


class ProductsPage extends StatelessWidget {
  final List<Map> productsList;


  ProductsPage(this.productsList);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
              leading: Icon(Icons.settings),
              title: Text('Manage Products'),
              // The empty onTap method will only add the clickable effect.
              onTap: () {
                // Navigation using the traditional ways
//                Navigator.pushReplacement(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => ProductsAdminPage(),
//                  ),
//                );

                // Using Named Routes
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Products(productsList),
    );
  }
}
