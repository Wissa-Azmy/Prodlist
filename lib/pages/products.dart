import 'Package:flutter/Material.Dart';
import 'package:scoped_model/scoped_model.dart';

import '../products.dart';
import '../scoped_models/main.dart';

class ProductsPage extends StatelessWidget {

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
          ScopedModelDescendant<MainModel>(builder: (context, widget, model) {
            return IconButton(
              icon: model.showFavorites
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: (){
                model.toggleDisplayMode();
              },
            );
          },)
        ],
      ),
      body: Products(),
    );
  }
}
