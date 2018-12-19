import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../scoped_models/products.dart';

class ProductCreatePage extends StatefulWidget {
  bool acceptedTerms = false;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null
  };


  void _submitForm(Function addProduct, Function updateProduct, int index) {
    // Run validators in all Fields if not success return.
    if (!_formkey.currentState.validate()) {
      return;
    }

    // Save form current state before using its data
    _formkey.currentState.save();
    final product = Product(
        title: _formData['title'],
        description: _formData['description'],
        image: 'assets/food.jpg',
        price: _formData['price']);

    if (index == null) {
      addProduct(product);
      Navigator.pushReplacementNamed(context, '/products-list');
    } else {
      updateProduct(product);
      Navigator.pushReplacementNamed(context, '/products-list');
    }
  }

  Widget _buildSubmitBtn() {
    return ScopedModelDescendant<ProductsModel>(
      builder: (context, widget, model) {
        return RaisedButton(
            child: model.selectedIndex == null ? Text('Save') : Text('Update'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () => _submitForm(
                model.addProduct,
                model.updateProduct,
                model.selectedIndex
            )
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Product product){
    double deviceWidth = MediaQuery.of(context).size.width;
    double padding = deviceWidth > 500 ? deviceWidth * 0.2 : deviceWidth * 0.05;
    return GestureDetector(
      onTap: () {
        // This dismisses the keyboard by focusing on an empty node.
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        // ListView always take all the available space width or height.
        child: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: padding),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                initialValue:
                product == null ? '' : product.title,
                onSaved: (String value) {
                  _formData['title'] = value;
                },
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Title is required & 5+ characters';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                initialValue:
                product == null ? '' : product.description,
                maxLines: null,
                onSaved: (value) {
                  _formData['description'] = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Description is required';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                initialValue: product == null
                    ? ''
                    : product.price.toString(),
                keyboardType: TextInputType.numberWithOptions(),
                onSaved: (value) {
                  _formData['price'] = double.parse(value);
                },
                validator: (value) {
                  if (value.isEmpty ||
                      !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
                    return 'Enter a valid number.';
                  }
                },
              ),
              SwitchListTile(
                title: Text('Accept Terms'),
                value: widget.acceptedTerms,
                onChanged: (bool value) {
                  // to reassign the value back to the switch when changed
                  setState(() {
                    widget.acceptedTerms = value;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitBtn()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ScopedModelDescendant<ProductsModel>(
        builder: (context, widget, model) {
          Product product = model.getSelectedProduct();
          final Widget pageContent = _buildPageContent(context, product);
          return WillPopScope(
            onWillPop: () {
              model.unsetSelectedIndex();
              // Popping Manually
              Navigator.pop(context, false);
              // Turning off the automatic Navigation popping
              return Future.value(false);
            },
            child: model.selectedIndex == null
                ? pageContent
                : Scaffold(
              appBar: AppBar(
                title: Text('Edit Product'),
              ),
              body: pageContent,
            ),
          );
        }
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
