import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}


class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue = "";
  String description = "";
  double priceValue;
  bool acceptedTerms = false;


  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': titleValue,
      'description': description,
      'price': priceValue
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products-list');
  }


  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetPadding = deviceWidth > 500 ? deviceWidth * 0.2 : deviceWidth * 0.05;

    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      // ListView always take all the available space width or height.
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 4,
            onChanged: (value) {
              description = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.numberWithOptions(),
            onChanged: (value) {
              priceValue = double.parse(value);
            },
          ),
          SwitchListTile(
            title: Text('Accept Terms'),
            value: acceptedTerms,
            onChanged: (bool value) {
              // to reassign the value back to the switch when changed
              setState(() {
                acceptedTerms = value;
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
              child: Text('Save'),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: _submitForm
          ),
        ],
      ),
    );
    /* Modal
    return Center (
      child: RaisedButton(child: Text('Save') ,onPressed: () {
        showModalBottomSheet(context: context, builder: (context){
          return Center(
            child: Text('This is a test Modal'),
          );
        });
      }),
    );
    */
  }
}
