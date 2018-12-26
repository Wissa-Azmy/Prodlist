import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../pages/product_page.dart';
import './price_tag.dart';
import '../models/product.dart';
import '../scoped_models/main.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final int index;

  ProductCard(this.product, this.index);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCard();
  }
}


class _ProductCard extends State<ProductCard> {
  Product product;
  bool favBtnToggle;

  @override
  void initState() {
    // TODO: implement initState
    product = widget.product;
    favBtnToggle = widget.product.isFavorite;
    super.initState();
  }


  void _infoBtnTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductPage(product),
      ),
    ).then((value) {
      if (value) {

      }
    });
  }


  void _favBtnTapped(Function setFavStatus) {
    setState(() {
      favBtnToggle = !favBtnToggle;
      setFavStatus(widget.index, favBtnToggle);
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(builder: (context, widget, model) {
      return Card(
        key: Key(product.title),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: _infoBtnTapped,
              child: Image.asset('assets/food.jpg'),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  PriceTag(product.price.toString()),
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
                    icon: Icon(
                      Icons.info,
                      size: 35.0,
                    ),
//                child: Text('Details'),
                    onPressed: _infoBtnTapped
                ),
                IconButton(
                  color: Colors.red,
                  icon: product.isFavorite
                      ? Icon(Icons.favorite, size: 35.0,)
                      : Icon(Icons.favorite_border, size: 35.0,),
                  onPressed: () => _favBtnTapped(model.setProductFavStatus),
//                child: Text('Delete'),
                )
              ],
            )
          ],
        ),
      );
    },);

  }
}
