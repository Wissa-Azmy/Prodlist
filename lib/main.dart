import 'Package:flutter/Material.Dart';
//import 'package:flutter/rendering.dart';

import 'pages/auth.dart';
import 'pages/products_admin.dart';
import 'pages/products.dart';

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
  List<Map<String, dynamic>> _productsList = [];

  void _addProduct(Map product) {
    // setState is used to dispatch any updates to the UI
    setState(() {
      _productsList.add(product);
    });
  }

  void _removeProduct(int index) {
    setState(() {
      _productsList.removeAt(index);
    });
  }

  void _updateProduct(int index, Map product)  {
    setState(() {
      _productsList[index] = product;
    });
  }

  // The build method is required by any Widget class that extends flutter State
  // BuildContext is the type of the context parameter
  @override  // Not required annotation - just for clarity and readability
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/products-list': (context) => ProductsPage(_productsList),
        '/admin': (context) => ProductsAdminPage(_updateProduct, _addProduct, _removeProduct, _productsList),
//        '/admin/products-list': (context) => ProductsListPage(_updateProduct, _productsList)
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => ProductsPage(_productsList)
        );
      },
    );
  }
}
