import 'Package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final Map product;

  ProductPage(this.product);

  _showAlertWindow(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are you sure'),
            content: Text('This action cannot be undone!'),
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('Discard'),),
              FlatButton(onPressed: () {
                Navigator.pop(context); // To dismiss the alert
                // To pop the product page and delete it
                Navigator.pop(context, true);
              }, child: Text('Continue'),),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        // Popping Manually to send our bool value
        Navigator.pop(context, false);
        // Turning off the automatic Navigation popping
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(product['title']),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
        Image.asset('assets/food.jpg'),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(product['description']),
        ),
        Container(
            padding: EdgeInsets.all(1.0),
            child: RaisedButton(
                color: Theme
                    .of(context)
                    .buttonColor,
                child: Text('Delete'),
                onPressed: () => _showAlertWindow(context),
      ),
    ),]
    )
    ,
    )
    );

  }
}
