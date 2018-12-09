import 'package:flutter/material.dart';

import '../pages/product_page.dart';
import './price_tag.dart';

class ProductCard extends StatefulWidget {
  final Map product;

  ProductCard(this.product);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCard();
  }
}

class _ProductCard extends State<ProductCard> {
  Map product;

  Widget favBtnIcon = Icon(Icons.favorite_border, size: 35.0,);
  bool favBtnToggle = false;

  @override
  void initState() {
    // TODO: implement initState
    product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  product['title'],
                  style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.0,
                ),
                PriceTag(product['price'].toString()),
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
                    builder: (context) => ProductPage(product),
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
}