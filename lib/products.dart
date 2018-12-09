import 'package:flutter/material.dart';

//import 'products_manager.dart';
import 'pages/product.dart';

class Products extends StatefulWidget {
  // final means the productsList array will not be changed once initialized
  final List<Map> productsList;

//  final Function removeProduct;

  // This is the class constructor. it has the exact class name
  Products(this.productsList);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsState();
  }
}
  // The above code translates to:
  /*
    Products(productsList) {
      this.productsList = productsList
    }
  */
class _ProductsState extends State<Products> {
  Widget favBtnIcon = Icon(Icons.favorite_border, size: 35.0,);
  bool favBtnToggle = false;

  Widget _buildProductsCards(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.productsList[index]['title'],
                  style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  child: Text(
                    '\$ ' + widget.productsList[index]['price'].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              '145 st, Maadi, Cairo',
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.info, size: 35.0,),
//                child: Text('Details'),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(widget.productsList[index]),
                      ),
                    ).then((value) {
                      if (value) {
//                        removeProduct(index);
                      }
                    }),
              ),
              IconButton(
                color: Colors.red,
                icon: favBtnIcon,
                onPressed: () {
                  setState(() {
                    if (favBtnToggle == false) {
                      favBtnToggle = true;
                      favBtnIcon = Icon(Icons.favorite, size: 35.0,);
                    } else {
                      favBtnToggle = false;
                      favBtnIcon = Icon(Icons.favorite_border, size: 35.0,);
                    }

                  });
                },
//                child: Text('Delete'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductsList() {
    Widget productsCards =
        Center(child: Text('No products found, please add some'));

    if (widget.productsList.length > 0) {
      // ListView: for static lists (renders all items and load them in memory)
      // ListView.builder: for dynamic lists
      productsCards = ListView.builder(
        itemBuilder: _buildProductsCards,
        itemCount: widget.productsList.length,
      );
    }

    /*
    else {
      // avoid returning null widgets instead return an empty container
      productsCards = Container()
    }
    */

    return productsCards;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildProductsList();
  }
}
