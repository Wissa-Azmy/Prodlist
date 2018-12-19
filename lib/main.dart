import 'Package:flutter/Material.Dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:flutter/rendering.dart';

import 'pages/auth.dart';
import 'pages/products_admin.dart';
import 'pages/products.dart';
import 'scoped_models/products.dart';

// Shorter function notation (only valid with functions containing 1 statement)
void main() {
  // to show detailed view grid debugging of the widgets
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // return the state of the class
    return _MyAppState();
  }
}

// The _ before the class name indicates that it has filePrivate access
// <MyApp> is used to link this state class to it's owner class
class _MyAppState extends State<MyApp> {

  // The build method is required by any Widget class that extends flutter State
  // BuildContext is the type of the context parameter
  @override  // Not required annotation - just for clarity and readability
  Widget build(BuildContext context) {
    return ScopedModel<ProductsModel>(
      // this model will be passed down to all child widgets
      model: ProductsModel(),
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
//          primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepPurple,
            fontFamily: 'Oswald',
        ),
          // The home argument and the '/' are equal so can't be used together
//      home: AuthPage(),
        routes: {
          '/': (context) => AuthPage(),
          '/products-list': (context) => ProductsPage(),
          '/admin': (context) => ProductsAdminPage(),
//        '/admin/products-list': (context) => ProductsListPage(_updateProduct, _productsList)
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => ProductsPage()
          );
        },
      ),
    );
  }
}
